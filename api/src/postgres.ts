import { Client } from "pg";

/** Get a new connection to the postgres database */
export async function getPostgresClient(): Promise<Client> {
  const client = new Client({
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DB,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    port: parseInt(process.env.POSTGRES_PORT),
  });
  await client.connect();
  return client;
}
