create or replace package Onecar is

end Onecar;
/
create or replace package body Onecar is
  ----------------------------------------------------------------------------------------------------
  c_Role_Admin    constant varchar2(20) := 'ADMIN';
  c_Role_Employee constant varchar2(20) := 'EMPLOYEE';
  c_Role_Client   constant varchar2(20) := 'CLIENT';

  ----------------------------------------------------------------------------------------------------
  Function User_Role_Exists
  (
    i_User_Id   number,
    i_Role_Code varchar2
  ) return boolean is
    v_Dummy number;
  begin
    select 1
      into v_Dummy
      from User_Roles t
     where t.User_Id = i_User_Id
       and t.Role_Code = i_Role_Code
       for update;
  
    return true;
  exception
    when No_Data_Found then
      return false;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Save
  (
    i_User_Id      number := null,
    i_First_Name   varchar2,
    i_Last_Name    varchar2,
    i_Middle_Name  varchar2 := null,
    i_Login        varchar2 := null,
    i_Password     varchar2 := null,
    i_Phone_Number varchar2 := null,
    i_Email        varchar2 := null,
    i_Status       varchar2
  ) is
  begin
    if i_User_Id is null then
      insert into Users
        (First_Name, Last_Name, Middle_Name, Login, Password, Phone_Number, Email, Status)
      values
        (i_First_Name,
         i_Last_Name,
         i_Middle_Name,
         i_Login,
         i_Password,
         i_Phone_Number,
         i_Email,
         i_Status);
    else
      update Users t
         set t.First_Name   = i_First_Name,
             t.Last_Name    = i_Last_Name,
             t.Middle_Name  = i_Middle_Name,
             t.Login        = i_Login,
             t.Password     = i_Password,
             t.Phone_Number = i_Phone_Number,
             t.Email        = i_Email,
             t.Status       = i_Status
       where t.User_Id = i_User_Id;
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Delete(i_User_Id number) is
    r_User  Users%rowtype;
    v_Dummy number;
  begin
    if User_Role_Exists(i_User_Id => i_User_Id, i_Role_Code => c_Role_Admin) then
      Raise_Application_Error(-20001, 'It is not allowed to delete admin user.');
    end if;
  
    delete Users t
     where t.User_Id = i_User_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Role_Save
  (
    i_User_Id   number,
    i_Role_Code varchar2
  ) is
  begin
    insert into User_Roles
      (User_Id, Role_Code)
    values
      (i_User_Id, i_Role_Code);
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Role_Delete
  (
    i_User_Id   number,
    i_Role_Code varchar2
  ) is
    v_Dummy number;
  begin
    select 1
      into v_Dummy
      from User_Roles t
     where t.User_Id = i_User_Id
       and t.Role_Code = c_Role_Admin;
  
    Raise_Application_Error(-20001, 'It is not allowed to delete role from admin user.');
  exception
    when No_Data_Found then
      delete User_Roles t
       where t.User_Id = i_User_Id
         and t.Role_Code = i_Role_Code;
  end;

  ----------------------------------------------------------------------------------------------------
  Function Client_Exists(i_Client_Id number) return boolean is
    v_Dummy number;
  begin
    select 1
      into v_Dummy
      from Clients t
     where t.Client_Id = i_Client_Id;
  
    return true;
  exception
    when No_Data_Found then
      return false;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Client_Save
  (
    i_Client_Id number,
    i_Status    varchar2
  ) is
  begin
    if i_Client_Id is null then
      insert into Clients
        (Client_Id, Status)
      values
        (i_Client_Id, i_Status);
    else
      update Clients t
         set t.Status = i_Status
       where t.Client_Id = i_Client_Id;
    
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Client_Delete(i_Client_Id number) is
  begin
    delete Clients t
     where t.Client_Id = i_Client_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Save
  (
    i_Car_Brand_Id number := null,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) is
  begin
    if i_Car_Brand_Id is null then
      insert into Car_Brands
        (name, Description)
      values
        (i_Name, i_Description);
    else
      update Car_Brands t
         set t.Name        = i_Name,
             t.Description = i_Description
       where t.Car_Brand_Id = i_Car_Brand_Id;
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Delete(i_Car_Brand_Id number) is
  begin
    delete Car_Brands t
     where t.Car_Brand_Id = i_Car_Brand_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Save
  (
    i_Car_Model_Id number := null,
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) is
  begin
    if i_Car_Model_Id is null then
      insert into Car_Models
        (Car_Brand_Id, name, Description)
      values
        (i_Car_Brand_Id, i_Name, i_Description);
    else
      update Car_Models t
         set t.Car_Brand_Id = i_Car_Brand_Id,
             t.Name         = i_Name,
             t.Description  = i_Description
       where t.Car_Model_Id = i_Car_Model_Id;
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Delete(i_Car_Model_Id number) is
  begin
    delete Car_Models t
     where t.Car_Model_Id = i_Car_Model_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Save
  (
    i_Car_Id              number := null,
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  ) is
  begin
    if i_Car_Id is null then
      insert into Cars
        (Car_Model_Id, Car_Brand_Id, Vin_Number, Year_Of_Manufacture)
      values
        (i_Car_Model_Id, i_Car_Brand_Id, i_Vin_Number, i_Year_Of_Manufacture);
    else
      update Cars t
         set t.Car_Model_Id        = i_Car_Model_Id,
             t.Car_Brand_Id        = i_Car_Brand_Id,
             t.Vin_Number          = i_Vin_Number,
             t.Year_Of_Manufacture = i_Year_Of_Manufacture
       where t.Car_Id = i_Car_Id;
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Delete(i_Car_Id number) is
  begin
    delete Cars t
     where t.Car_Id = i_Car_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Car_Save
  (
    i_User_Id      number,
    i_Car_Id       number,
    i_State_Number varchar2,
    i_Color        varchar2,
    i_Status       varchar2
  ) is
  begin
    update User_Cars t
       set t.State_Number = i_State_Number,
           t.Color        = i_Color,
           t.Status       = i_Status
     where t.User_Id = i_User_Id
       and t.Car_Id = i_Car_Id;
  
    if sql%notfound then
      insert into User_Cars
        (User_Id, Car_Id, State_Number, Color, Status)
      values
        (i_User_Id, i_Car_Id, i_State_Number, i_Color, i_Status);
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Car_Delete
  (
    i_User_Id number,
    i_Car_Id  number
  ) is
  begin
    delete User_Cars t
     where t.User_Id = i_User_Id
       and t.Car_Id = i_Car_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Save
  (
    i_Service_Group_Id number := null,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Order_No         number := null
  ) is
  begin
    if i_Service_Group_Id is null then
      insert into Service_Groups
        (name, Status, Order_No)
      values
        (i_Name, i_Status, i_Order_No);
    else
      update Service_Groups t
         set t.Name     = i_Name,
             t.Status   = i_Status,
             t.Order_No = i_Order_No
       where t.Service_Group_Id = i_Service_Group_Id;
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Delete(i_Service_Group_Id number) is
  begin
    delete Service_Groups t
     where t.Service_Group_Id = i_Service_Group_Id;
  end;

end Onecar;
/
