import React, {useEffect, useState} from 'react';
import {
    Avatar,
    Box,
    CircularProgress,
    ImageList,
    ImageListItem,
    Modal,
    Typography,
    Card,
    Container
} from '@mui/material';
import loading from './loader.png'
import LocationOnIcon from '@mui/icons-material/LocationOn';
import './notFound.css';

const style = {
    position: 'absolute' as 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: '50%',
    height:'50%',
    padding: 1,
    bgcolor: 'background.paper',
    boxShadow: 24,
    p: 2,
};
type Photo = {
    bio: string;
    collection_id: number;
    description: string;
    height: number;
    id: number;
    instagram_username: string;
    location: string;
    name: string;
    photographer_id: number;
    profile_image_url: string;
    title: string;
    twitter_username: string;
    url: string;
    width: number;
};
type FilterCriteriaPropType = {
    city: string,
    title: string,

};

/*
 PhotoList Component Feature
 1)display all photo on component load in a Mosnory View.
 2)display photo based on filter Criteria.
 3)clicking on particular photo will display detail of that photo.
 4)no result ui error
*/
const PhotosList = ({ city, title } : FilterCriteriaPropType) => {
    const [photoData, setPhotoData] = useState<any[]>([{}]);
    const [open, setOpen] = React.useState(false);
    const[isLoading,setIsLoading]= useState(true);
    const[selectedPhoto, setSelectedPhoto]= useState<Photo>({
        bio: "",
        collection_id: 0,
        description: "",
        height: 0,
        id: 0,
        instagram_username: "",
        location: "",
        name: "",
        photographer_id: 0,
        profile_image_url: "",
        title: "",
        twitter_username: "",
        url: "",
        width: 0,
    })
    //used for Modal Open
    const handleOpen = (e : any) => {
        setOpen(true);
        let photo = photoData.find((photo) => {
               return photo.id == e.target.id
            })
        setSelectedPhoto(photo)
    }
    //used for Modal Closed
    const handleClose = () => setOpen(false);


    //displaying photo with filter criteria
    const apiCall = () => {
            setIsLoading(true)
            const myHeaders = new Headers();
            myHeaders.append("Content-Type", "application/json");

            const raw = JSON.stringify({
                "city": city,
                "title": title
            });

            const reqOptions = {
                method: 'POST',
                headers: myHeaders,
                body: raw,
            };
            fetch("http://nishipatel.ca:8080/filter", reqOptions)
                .then(response => response.json())
                .then((result) => {
                    setPhotoData(result)
                    setIsLoading(false)
                })
                .catch(error => console.log('error', error));
        }

    useEffect(() => {
       apiCall()
    }, [city,title])

    return(
        <div>

            <Box sx={{  padding: '5%', margin: '3%' }}>
                {photoData.length >= 1 &&
                <ImageList variant="masonry"  cols={3} gap={8} >
                    {photoData.map((item,index) => (
                        <ImageListItem key={index}>
                            <img
                                src={`${item.url}?w=248&fit=crop&auto=format`}
                                srcSet={`${item.url}?w=248&fit=crop&auto=format&dpr=2 2x`}
                                alt={item.description}
                                id={item.id}
                                loading="lazy"
                                onClick={handleOpen}
                            />
                        </ImageListItem>
                    ))}
                </ImageList>}
                {isLoading &&
                    <Box sx={{ top: '50%', left: '50%'}}>
                                <img src={loading} className="App-logo" alt="logo" />
                    </Box>
                }
                {photoData.length === 0 && (
                    <section className="page_404">
                        <div className="container">
                            <div className="row">
                                <div className="col-sm-12 ">
                                    <div className="col-sm-10 col-sm-offset-1  text-center">
                                        <div className="four_zero_four_bg">
                                            <h1 className="text-center ">404</h1>
                                        </div>
                                        <div className="contant_box_404">
                                            <h3 className="h2">
                                                Look like you're lost
                                            </h3>
                                            <p>This city and collection combination doesn't have any Images. </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                )}
            </Box>
            <Modal
                open={open}
                onClose={handleClose}
                aria-labelledby="modal-modal-title"
                aria-describedby="modal-modal-description"
            >
                <Box sx={style}>

                    <img src={selectedPhoto.url}
                         alt={"img"}
                         style={{width:  '90%', height:'90%' , objectFit: 'scale-down'}}
                    />
                    <div style={{display:'flex',flexDirection: 'row', float:'left'}}>
                        <div style={{alignItems:'flex-start'}}>
                            <Avatar alt={selectedPhoto.name} src={selectedPhoto.profile_image_url} />
                        </div>
                        <div style={{alignItems:'flex-end'  }}>
                            <Typography style={{fontSize:"1.5rem"}}>
                                {selectedPhoto?.name}
                            </Typography>
                            {selectedPhoto.instagram_username || selectedPhoto.twitter_username ?
                                (
                                    <Typography style={{fontSize:10}}>
                                        @{selectedPhoto.instagram_username ? selectedPhoto.instagram_username : selectedPhoto.twitter_username}
                                    </Typography>
                                ) :
                                (
                                    <></>
                                )}
                        </div>
                    </div>
                    <div style={{float: 'right'}}>
                        <div>
                            {selectedPhoto.location ?
                                (
                                    <div style={{display:'flex',flexDirection: 'row'}}>
                                        <LocationOnIcon />
                                        <Typography style={{fontSize:"1.5rem"}}>
                                            {selectedPhoto.location}
                                        </Typography>
                                    </div>
                                )
                                : (
                                    <></>
                                )
                            }
                        </div>
                    </div>

                </Box>
            </Modal>
        </div>
    )
}

export default PhotosList