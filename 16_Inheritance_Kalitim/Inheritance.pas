program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  TPerson = class(TObject)
    FirstName: string;
    LastName: string;
    function FullName: string; virtual;
  end;

  TEmployee = class(TPerson)
    EmployeeID: integer;
    Salary: double;
    function CalculateYearlySalary: double;
    function FullName: string; override;
  end;

  { TPerson }

function TPerson.FullName: string;
begin
  Result := FirstName + ' ' + LastName;
end;

var
  Person: TPerson;
  Employee: TEmployee;

  { TEmployee }

function TEmployee.CalculateYearlySalary: double;
begin
  Result := Salary * 12;
end;

function TEmployee.FullName: string;
begin
  Result := 'Employee is ' + inherited FullName;
end;

begin

  Person := TPerson.Create;
  try
    Person.FirstName := 'Abdullah';
    Person.LastName := 'ILGAZ';
    WriteLn('Your name is ' + Person.FullName);
  finally
    Person.Free;
  end;

  Employee := TEmployee.Create;
  try
    Employee.FirstName := 'Michael';
    Employee.LastName := 'Jordan';
    Employee.EmployeeID := 23;
    Employee.Salary := 10000;
    WriteLn(Employee.FullName + '. Employee ID is ' + Employee.EmployeeID.ToString);
  finally
    Employee.Free;
  end;

  ReadLn;

end.
