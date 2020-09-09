const mysql = require("mysql");
const inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "Juicyfruit20!",
  database: "employee_tracker_db",
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId + "\n");
  start();
});

function start() {
  inquirer
    .prompt({
      message: "What would you like to do?",
      type: "list",
      choices: [
        "View all departments",
        "View all employees",
        "View all roles",
        "Add department",
        "Add role",
        "Add employee",
        "Update employee role",
        "EXIT",
      ],

      name: "choice",
    })
    .then((answers) => {
      console.log(answers.choice);
      switch (answers.choice) {
        case "View all employees":
          viewEmployees();
          break;

        case "View all departments":
          viewDepartments();
          break;

        case "View all roles":
          viewRoles();
          break;

        case "Add employee":
          addEmployee();
          break;

        case "Add department":
          addDepartment();
          break;

        case "Add role":
          addRole();
          break;

        case "Update employee role":
          updateEmployeeRole();
          break;

        default:
          connection.end();
          break;
      }
    });
}

function viewDepartments() {
  connection.query("SELECT * FROM department", function (err, data) {
    console.table(data);
    start();
  });
}

function viewEmployees() {
  connection.query(
    "SELECT roles.title, roles.salary, employee.first_name, employee.last_name FROM roles INNER JOIN employee ON (employee.role_id = role_id)",
    function (err, data) {
      console.table(data);
      start();
    }
  );
}

function viewRoles() {
  connection.query(
    "SELECT roles.id, roles.title, roles.salary, department.name As Dept fROM roles INNER JOIN department on (roles.department_id = department.id)",
    function (err, data) {
      console.table(data);
      start();
    }
  );
}
