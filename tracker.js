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

// STARTS CHOICE PROMPT
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

function addDepartment() {
  inquirer
    .prompt([
      {
        type: "input",
        name: "department",
        message: "What department do you want to add?",
      },
    ])
    .then(function (res) {
      connection.query(
        "INSERT INTO department (name) VALUES (?)",
        [res.department],
        function (err, data) {
          if (err) throw err;
          console.table(data);
          start();
        }
      );
    });
}

function addEmployee() {
  inquirer
    .prompt([
      {
        type: "input",
        name: "firstName",
        message: "What is the employee's first name?",
      },
      {
        type: "input",
        name: "lastName",
        message: "What is the employee's last name?",
      },
      {
        type: "number",
        name: "roleId",
        message: "What is the employee's role ID",
      },
      {
        type: "number",
        name: "managerId",
        message: "What is the employee's manager's ID?",
      },
    ])
    .then(function (res) {
      connection.query(
        "INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES (?, ?, ?, ?)",
        [res.firstName, res.lastName, res.roleId, res.managerId],
        function (err, data) {
          if (err) throw err;
          console.table(data);
          start();
        }
      );
    });
}
function addRole() {
  inquirer
    .prompt([
      {
        type: "input",
        name: "title",
        message: "Title of role:",
      },
      {
        type: "number",
        name: "salary",
        message: "Enter salary:",
      },
      {
        type: "number",
        name: "department_id",
        message: "Enter department ID:",
      },
    ])
    .then(function (res) {
      connection.query(
        "INSERT INTO roles (title, salary, department_id) values (?, ?, ?)",
        [res.title, res.salary, res.department_id],
        function (err, data) {
          console.table(data);
        }
      );
      start();
    });
}
function updateEmployeeRole() {
  inquirer
    .prompt([
      {
        type: "input",
        name: "name",
        message: "Which employee would you like to update? (first name only)",
      },
      {
        type: "number",
        name: "role_id",
        message: "Enter new role ID:",
      },
    ])
    .then(function (res) {
      connection.query(
        "UPDATE employee SET role_id = ? WHERE first_name = ?",
        [res.role_id, res.name],
        function (err, data) {
          console.table(data);
        }
      );
      start();
    });
}
