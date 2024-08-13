import mariadb from 'mariadb';

const pool = mariadb.createPool({
    host: 'localhost',
    database: 'paralelepipedo',
    user: 'root',
    password: '',
    connectionLimit: 5
});

pool.getConnection()
.then((res) => {
    console.log('success', res);
})
.catch((err) => {
    console.log('erro na conexão', err);
});
