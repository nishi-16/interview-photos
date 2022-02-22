import React, {useEffect, useState} from 'react';
import {AppBar, Button, FormControl, MenuItem, Select, TextField, Toolbar} from "@mui/material";
import PhotosList from "./PhotosList";
import logo from './Logo.png'

/*
 Build the AppBar with textfield and dropdown(collections).
*/
type FilterCriteriaPropType = {
    city: string;
    title: string;
}
const NavigationBar = () => {
    const [selectedCollection, setSelectedCollection] = useState('');
    const [selectedCity, setSelectedCity] = useState('');
    const [collectionData, setCollectionData] = useState<any[]>(['None']);
    const [filterCriteria, setFilterCriteria] = useState<FilterCriteriaPropType>({
        city:"",
        title:""
    });

    const getAllCollections = async () => {
        try{
            const response = await fetch("http://localhost:8080/collections");
            const jsonData = await response.json()
            setCollectionData(jsonData)
        }catch(err){
            console.log("error", err)
        }
    }

    const submit = () => {
        setFilterCriteria({
            city: selectedCity,
            title: selectedCollection
        })

    };

    useEffect(() => {
        getAllCollections();
    }, [])

    return(
        <div>
            <AppBar style={{backgroundColor:"#050417"}}>
                <Toolbar>
                    <img src={logo}  alt="logo" style={{height: 50, marginRight: '2%' }} />
                    <TextField id="outlined-basic"
                               label="Cities" variant="filled"
                               style={{minWidth: '30%', marginRight: '5%', borderRadius: "10px", backgroundColor: "#E5E5E5"}}
                               inputProps={{style: {fontSize: "1.5rem"}}}
                               InputLabelProps={{style: {fontSize: "1.5rem"}}}
                               value={selectedCity}
                               onChange={(e)=>{
                                   setSelectedCity(e.target.value)
                               }}
                    />
                    <FormControl sx={{ m: 1, minWidth: '30%' }} style={{ marginRight: '5%', border: "0px"}}>
                        <Select
                            value={selectedCollection}
                            onChange={(e)=>{
                               setSelectedCollection(e.target.value)
                            }}
                            displayEmpty
                            style={{fontSize: "1.5rem", backgroundColor: "#E5E5E5", border: "0px", borderRadius: "10px"}}
                            inputProps={{ 'aria-label': 'Without label',underline: {
                                    "&&&:before": {
                                        borderBottom: "none"
                                    },
                                    "&&:after": {
                                        borderBottom: "none"
                                    }
                                } }}
                        >
                            <MenuItem value={'None'} style={{fontSize: "1.5rem"}} >None</MenuItem>
                            {collectionData.map((collection, index) => (
                                <MenuItem value={collection.title} style={{fontSize: "1.5rem"}} key={index}>{collection.title}</MenuItem>
                            ))}
                        </Select>
                    </FormControl>
                    <Button variant={"outlined"}
                            style={{ borderRadius: 50, width: '20%', backgroundColor:"#2A2B8D", color:"#fff", fontSize: "1.5rem" }}
                            onClick={submit}
                    >
                        search
                    </Button>
                </Toolbar>
            </AppBar>
            <PhotosList
                city={filterCriteria.city}
                title={filterCriteria.title}
            />
        </div>
    )
}
export default NavigationBar