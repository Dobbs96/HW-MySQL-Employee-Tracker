const mysql = require("mysql");

const inquirer = require("inquirer");

const cTable = require("console.table");

const connection = mysql.createConnection({
  host: "localhost",

  port: 3306,

  user: "root",

  password: "q1w2e3",
  database: "Employee_DB",
});

connection.connect((err) => {
  if (err) throw err;
  console.log(`connected as id ${connection.threadId}`);
  start();
});

const startQuestions = [
  {
    type: "list",
    message: "What would you like to do?",
    name: "userChoice",
    choices: [
      "View All Employees",
      "View All Employees by Department",
      "View All Employees by Manager",
      "View All Departments",
      "View All Roles",
      "View Employee",
      "View Total Salary",
      "Update Employee Name",
      "Update Employee Title",
      "Update Employee Manager",
      "Add Employee",
      "Add Department",
      "Add Role",
      "Remove Employee",
      "Remove Department",
      "Remove Role",
      "Exit",
    ],
  },
];

const start = async () => {
  const { userChoice } = await inquirer.prompt(startQuestions);
  switch (userChoice) {
    case "View All Employees":
      return allEmployess();
    case "View All Employees by Department":
      return employeesDepartments();
    case "View All Employees by Manager":
      return employeesManager();
    case "View All Departments":
      return departments();
    case "View All Roles":
      return roles();
    case "View Total Salary":
      return salary();
    case "Update Employee Name":
      return updateName();
    case "Update Employee Title":
      return updateTitle();
    case "Update Employee Manager":
      return updateManager();
    case "Add Employee":
      return addEmployee();
    case "Add Department":
      return addDepartment();
    case "Add Role":
      return addRole();
    case "Remove Employee":
      return removeEmployee();
    case "Remove Department":
      return removeDepartment();
    case "Remove Role":
      return removeRole();
    case "Exit":
      return connection.end();
  }
};
// View All Employees
const allEmployess = () => {
  const query = connection.query(
    `SELECT employees.id,  CONCAT(employees.first_name, " " , employees.last_name) AS full_name, roles.title, roles.salary, departments.department, CONCAT(employee.first_name, ' ' ,employee.last_name) AS manager 
  FROM employees 
  INNER JOIN roles on roles.id = employees.role_id 
  INNER JOIN departments on departments.id = roles.department_id 
  LEFT JOIN employees employee on employees.manager_id = employee.id;`,
    (err, res) => {
      if (err) throw err;
      console.table("\n", res);
      start();
    }
  );
};
// View All Employees by Department
const employeesDepartments = () => {
  const query = connection.query(
    `SELECT employees.id, CONCAT(employees.first_name, " ", employees.last_name) AS full_name, departments.department
  FROM employees
  INNER JOIN roles on roles.id = employees.role_id
  INNER JOIN departments on departments.id = roles.department_id
  ORDER BY employees.id;`,
    (err, res) => {
      if (err) throw err;
      console.table(res);
      start();
    }
  );
};
// View All Employees by Manager
const employeesManager = () => {
  const query = connection.query(
    `SELECT employees.id,  CONCAT(employees.first_name, " " , employees.last_name) AS full_name, CONCAT(employee.first_name, ' ' ,employee.last_name) AS manager 
  FROM employees 
  INNER JOIN roles on roles.id = employees.role_id 
  INNER JOIN departments on departments.id = roles.department_id 
  LEFT JOIN employees employee on employees.manager_id = employee.id;`,
    (err, res) => {
      if (err) throw err;
      console.table(res);
      start();
    }
  );
};
// View All Departments
const departments = () => {
  const query = connection.query("SELECT * FROM departments;", (err, res) => {
    if (err) throw err;
    console.table(res);
    start();
  });
};
// View All Roles
const roles = () => {
  const query = connection.query(
    "SELECT roles.id, roles.title FROM roles;",
    (err, res) => {
      if (err) throw err;
      console.table(res);
      start();
    }
  );
};
// View Total Salary
const salary = () => {
  const query = connection.query(
    `SELECT SUM(salary) AS Total_Salary
  FROM employees
  INNER JOIN roles on roles.id = employees.role_id
  ORDER BY employees.id;`,
    (err, res) => {
      if (err) throw err;
      console.table(res);
      start();
    }
  );
};
// Update Employee Name
const updateName = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Update Employee Title
const updateTitle = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Update Employee Manager
const updateManager = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Add Employee
const addEmployee = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Add Department
const addDepartment = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Add Role
const addRole = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Remove Employee
const removeEmployee = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Remove Department
const removeDepartment = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
// Remove Role
const removeRole = () => {
  const query = connection.query("QUERY HERE", (err, res) => {
    if (err) throw err;
    console.log(res);
    start();
  });
};
