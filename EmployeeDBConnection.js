// REQUIRES
const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",

  port: 3306,

  user: "root",

  password: "",
  database: "Employee_DB",
});

connection.connect((err) => {
  if (err) throw err;
  console.log(`connected as id ${connection.threadId}`);
  afterConnection("Electronic");
});
/////////  ^^^^ALL artist with Electronic as genre ^^^   ///////////////
const afterConnection = (genre) => {
  connection.query(
    "SELECT artist FROM songs WHERE genre = ?",
    [genre],
    (err, res) => {
      if (err) throw err;
      console.log(res);
      connection.end();
    }
  );
};
