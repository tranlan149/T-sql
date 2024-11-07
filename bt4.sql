create database bai4;
use bai4;
create table Projects(
	ProjectID INT PRIMARY KEY AUTO_INCREMENT,
	ProjectName VARCHAR(100) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Budget DECIMAL(10, 2) NOT NULL
);
create table Employees(
	EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
	EmployeeName VARCHAR(100) NOT NULL,
	Position VARCHAR(50) NOT NULL,
	HireDate DATE NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL
);
create table Tasks(
	TaskID INT PRIMARY KEY AUTO_INCREMENT,
	ProjectID INT,
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
	TaskName VARCHAR(100) NOT NULL,
	AssignedTo INT, 
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Status VARCHAR(50) NOT NULL,
	HoursWorked DECIMAL(5, 2) NOT NULL
);
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Budget) 
VALUES 
(1, 'Xây dựng tòa nhà A', '2024-01-10', '2024-12-30', 500000.00),   
(2, 'Phát triển ứng dụng', '2024-03-01', '2024-09-15', 200000.00),      
(3, 'Nghiên cứu thị trường', '2024-05-05', '2024-10-20', 150000.00);
insert into Employees
value(1,'Nguyễn Văn An','Quản lý dự án','2022-05-01',	20000.00),
	(2,	'Trần Thị Bình', 'Lập trình viên', '2023-01-10', 15000.00),
	(3,'Lê Văn Cường','Chuyên viên QA',	'2023-06-15',	12000.00),
	(4,'Phạm Thị Dung', 'kế toán', '2024-02-20', 14000.00),
	(5, 'Hoàng Văn Hùng', 'Thiết kế UI/UX', '2023-04-05', 13000.00);
insert into Tasks
value(1, 1, 'Lập kế hoạch', 1, '2024-01-10', '2024-01-20',	'Hoàn thành',	40.00),
	(2,	1,	'Giám sát thi công', 3, '2024-01-21', '2024-06-30', 'Đang tiến hành', 150.00),
	(3, 2, 'Thiết kế giao diện', 5, '2024-03-01', '2024-03-15', 'Hoàn thành',60.00),
	(4, 2, 'Phát triển tính năng', 2, '2024-03-16', '2024-06-01', 'Đang tiến hành', 200.00),
	(5, 3, 'Thu thập dữ liệu', 4, '2024-05-05', '2024-06-30', 'Hoàn thành',	80.00),
	(6, 3, 'Phân tích dữ liệu', 3, '2024-07-01', '2024-08-15', 'Đang tiến hành',90.00);
update  Projects
set budget=50000.00
where ProjectID =2;
select*from projects;
update Tasks
set HoursWorked=25.50
where TaskID=4;
select*from Tasks;
delete from Tasks
where AssignedTo=3;
delete from Employees
where  EmployeeID = 3;
delete from Tasks
where TaskID = 5;
select p.ProjectID, p.ProjectName, sum(t.HoursWorked)*50.00
from Projects p
join Tasks t on t.ProjectID = p.ProjectID
group by p.ProjectID, p.ProjectName;
select position, avg(salary) from employees
group by position;
SELECT e.employeeID, e.employeeName, e.position, 
       COUNT(t.TaskID) AS 'số lượng công việc đã thực hiện', 
       COALESCE(SUM(t.HoursWorked), 0) AS 'Tổng số giờ làm việc'
FROM Employees e
LEFT JOIN Tasks t ON e.employeeID = t.AssignedTo
GROUP BY e.employeeID, e.employeeName, e.position;
select p.projectID, p.projectName ,
(select count(*)  from tasks t where t.projectID = p. projectID and t.Status = 'Hoàn thành') AS 'Số công việc hoàn thành',
(SELECT COUNT(*) FROM Tasks t WHERE t.ProjectID = p.ProjectID AND t.Status = 'Đang thực hiện') AS 'Số công việc đang thực hiện'
FROM Projects p;



    



