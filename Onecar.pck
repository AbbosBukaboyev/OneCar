create or replace package Onecar is
  ----------------------------------------------------------------------------------------------------
  Procedure User_Insert
  (
    i_First_Name   varchar2,
    i_Last_Name    varchar2,
    i_Middle_Name  varchar2 := null,
    i_Login        varchar2 := null,
    i_Password     varchar2 := null,
    i_Phone_Number varchar2 := null,
    i_Email        varchar2 := null,
    i_Status       varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Function User_Insert
  (
    i_First_Name   varchar2,
    i_Last_Name    varchar2,
    i_Middle_Name  varchar2 := null,
    i_Login        varchar2 := null,
    i_Password     varchar2 := null,
    i_Phone_Number varchar2 := null,
    i_Email        varchar2 := null,
    i_Status       varchar2
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure User_Update
  (
    i_User_Id      number,
    i_First_Name   varchar2,
    i_Last_Name    varchar2,
    i_Middle_Name  varchar2 := null,
    i_Login        varchar2 := null,
    i_Password     varchar2 := null,
    i_Phone_Number varchar2 := null,
    i_Email        varchar2 := null,
    i_Status       varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure User_Delete(i_User_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure User_Role_Save
  (
    i_User_Id   number,
    i_Role_Code varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure User_Role_Delete
  (
    i_User_Id   number,
    i_Role_Code varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Client_Save
  (
    i_Client_Id number,
    i_Status    varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Client_Delete(i_Client_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Insert
  (
    i_Name        varchar2,
    i_Description varchar2 := null
  );
  ----------------------------------------------------------------------------------------------------
  Function Car_Brand_Insert
  (
    i_Name        varchar2,
    i_Description varchar2 := null
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Update
  (
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Delete(i_Car_Brand_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Insert
  (
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  );
  ----------------------------------------------------------------------------------------------------
  Function Car_Model_Insert
  (
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Update
  (
    i_Car_Model_Id number,
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Delete(i_Car_Model_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Insert
  (
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Function Car_Insert
  (
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Update
  (
    i_Car_Id              number,
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Delete(i_Car_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Client_Car_Save
  (
    i_Client_Id    number,
    i_Car_Id       number,
    i_State_Number varchar2,
    i_Color        varchar2,
    i_Status       varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Client_Car_Delete
  (
    i_Client_Id number,
    i_Car_Id    number
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Insert
  (
    i_Name     varchar2,
    i_Status   varchar2,
    i_Order_No number := null
  );
  ----------------------------------------------------------------------------------------------------
  Function Service_Group_Insert
  (
    i_Name     varchar2,
    i_Status   varchar2,
    i_Order_No number := null
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Update
  (
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Order_No         number := null
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Delete(i_Service_Group_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Insert
  (
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Price            number,
    i_Order_No         number := null
  );
  ----------------------------------------------------------------------------------------------------
  Function Service_Insert
  (
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Price            number,
    i_Order_No         number := null
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Update
  (
    i_Service_Id       number,
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Price            number,
    i_Order_No         number := null
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Delete(i_Service_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Component_Insert
  (
    i_Name           varchar2,
    i_Component_Type varchar2,
    i_Status         varchar2,
    i_Price          number
  );
  ----------------------------------------------------------------------------------------------------
  Function Car_Component_Insert
  (
    i_Name           varchar2,
    i_Component_Type varchar2,
    i_Status         varchar2,
    i_Price          number
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Component_Update
  (
    i_Car_Component_Id number,
    i_Name             varchar2,
    i_Component_Type   varchar2,
    i_Status           varchar2,
    i_Price            number
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Car_Component_Delete(i_Car_Component_Id number);
  ----------------------------------------------------------------------------------------------------
  Procedure Request_Insert
  (
    i_Request_Time   timestamp,
    i_Request_Type   varchar2,
    i_Client_Id      number,
    i_User_Id        number,
    i_Issue_Details  varchar2 := null,
    i_Issue_File_Sha varchar2 := null,
    i_Status         varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Function Request_Insert
  (
    i_Request_Time   timestamp,
    i_Request_Type   varchar2,
    i_Client_Id      number,
    i_User_Id        number,
    i_Issue_Details  varchar2 := null,
    i_Issue_File_Sha varchar2 := null,
    i_Status         varchar2
  ) return number;
  ----------------------------------------------------------------------------------------------------
  Procedure Request_Update
  (
    i_Request_Id     number,
    i_Request_Time   timestamp,
    i_Request_Type   varchar2,
    i_Client_Id      number,
    i_User_Id        number,
    i_Issue_Details  varchar2 := null,
    i_Issue_File_Sha varchar2 := null,
    i_Status         varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Request_Service_Save
  (
    i_Request_Id number,
    i_Service_Id number,
    i_Price      number,
    i_Note       varchar2
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Request_Service_Delete
  (
    i_Request_Id number,
    i_Service_Id number
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Item_Save
  (
    i_Request_Id       number,
    i_Service_Id       number,
    i_Car_Component_Id number,
    i_Count            number,
    i_Price            number,
    i_Total_Amount     number
  );
  ----------------------------------------------------------------------------------------------------
  Procedure Service_Item_Delete
  (
    i_Request_Id       number,
    i_Service_Id       number,
    i_Car_Component_Id number
  );
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
  Procedure User_Insert
  (
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
  end;

  ----------------------------------------------------------------------------------------------------
  Function User_Insert
  (
    i_First_Name   varchar2,
    i_Last_Name    varchar2,
    i_Middle_Name  varchar2 := null,
    i_Login        varchar2 := null,
    i_Password     varchar2 := null,
    i_Phone_Number varchar2 := null,
    i_Email        varchar2 := null,
    i_Status       varchar2
  ) return number is
    v_User_Id number;
  begin
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
       i_Status)
    returning User_Id into v_User_Id;
  
    return v_User_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure User_Update
  (
    i_User_Id      number,
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
    if User_Role_Exists(i_User_Id => i_User_Id, i_Role_Code => c_Role_Admin) then
      Raise_Application_Error(-20001, 'It is not allowed to delete role from admin user.');
    end if;
  
    delete User_Roles t
     where t.User_Id = i_User_Id
       and t.Role_Code = i_Role_Code;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Client_Save
  (
    i_Client_Id number,
    i_Status    varchar2
  ) is
  begin
    update Clients t
       set t.Status = i_Status
     where t.Client_Id = i_Client_Id;
  
    if sql%notfound then
      insert into Clients
        (Client_Id, Status)
      values
        (i_Client_Id, i_Status);
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Client_Delete(i_Client_Id number) is
  begin
    delete Clients t
     where t.Client_Id = i_Client_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Insert
  (
    i_Name        varchar2,
    i_Description varchar2 := null
  ) is
  begin
    insert into Car_Brands
      (name, Description)
    values
      (i_Name, i_Description);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Car_Brand_Insert
  (
    i_Name        varchar2,
    i_Description varchar2 := null
  ) return number is
    v_Car_Brand_Id number;
  begin
    insert into Car_Brands
      (name, Description)
    values
      (i_Name, i_Description)
    returning Car_Brand_Id into v_Car_Brand_Id;
  
    return v_Car_Brand_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Update
  (
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) is
  begin
    update Car_Brands t
       set t.Name        = i_Name,
           t.Description = i_Description
     where t.Car_Brand_Id = i_Car_Brand_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Brand_Delete(i_Car_Brand_Id number) is
  begin
    delete Car_Brands t
     where t.Car_Brand_Id = i_Car_Brand_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Insert
  (
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) is
  begin
    insert into Car_Models
      (Car_Brand_Id, name, Description)
    values
      (i_Car_Brand_Id, i_Name, i_Description);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Car_Model_Insert
  (
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) return number is
    v_Car_Model_Id number;
  begin
    insert into Car_Models
      (Car_Brand_Id, name, Description)
    values
      (i_Car_Brand_Id, i_Name, i_Description)
    returning Car_Model_Id into v_Car_Model_Id;
  
    return v_Car_Model_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Update
  (
    i_Car_Model_Id number,
    i_Car_Brand_Id number,
    i_Name         varchar2,
    i_Description  varchar2 := null
  ) is
  begin
    update Car_Models t
       set t.Car_Brand_Id = i_Car_Brand_Id,
           t.Name         = i_Name,
           t.Description  = i_Description
     where t.Car_Model_Id = i_Car_Model_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Model_Delete(i_Car_Model_Id number) is
  begin
    delete Car_Models t
     where t.Car_Model_Id = i_Car_Model_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Insert
  (
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  ) is
  begin
    insert into Cars
      (Car_Model_Id, Car_Brand_Id, Vin_Number, Year_Of_Manufacture)
    values
      (i_Car_Model_Id, i_Car_Brand_Id, i_Vin_Number, i_Year_Of_Manufacture);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Car_Insert
  (
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  ) return number is
    v_Car_Id number;
  begin
    insert into Cars
      (Car_Model_Id, Car_Brand_Id, Vin_Number, Year_Of_Manufacture)
    values
      (i_Car_Model_Id, i_Car_Brand_Id, i_Vin_Number, i_Year_Of_Manufacture)
    returning Car_Id into v_Car_Id;
  
    return v_Car_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Update
  (
    i_Car_Id              number,
    i_Car_Model_Id        number,
    i_Car_Brand_Id        number,
    i_Vin_Number          varchar2,
    i_Year_Of_Manufacture varchar2
  ) is
  begin
    update Cars t
       set t.Car_Model_Id        = i_Car_Model_Id,
           t.Car_Brand_Id        = i_Car_Brand_Id,
           t.Vin_Number          = i_Vin_Number,
           t.Year_Of_Manufacture = i_Year_Of_Manufacture
     where t.Car_Id = i_Car_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Delete(i_Car_Id number) is
  begin
    delete Cars t
     where t.Car_Id = i_Car_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Client_Car_Save
  (
    i_Client_Id    number,
    i_Car_Id       number,
    i_State_Number varchar2,
    i_Color        varchar2,
    i_Status       varchar2
  ) is
  begin
    update Client_Cars t
       set t.State_Number = i_State_Number,
           t.Color        = i_Color,
           t.Status       = i_Status
     where t.Client_Id = i_Client_Id
       and t.Car_Id = i_Car_Id;
  
    if sql%notfound then
      insert into Client_Cars
        (Client_Id, Car_Id, State_Number, Color, Status)
      values
        (i_Client_Id, i_Car_Id, i_State_Number, i_Color, i_Status);
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Client_Car_Delete
  (
    i_Client_Id number,
    i_Car_Id    number
  ) is
  begin
    delete Client_Cars t
     where t.Client_Id = i_Client_Id
       and t.Car_Id = i_Car_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Insert
  (
    i_Name     varchar2,
    i_Status   varchar2,
    i_Order_No number := null
  ) is
  begin
    insert into Service_Groups
      (name, Status, Order_No)
    values
      (i_Name, i_Status, i_Order_No);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Service_Group_Insert
  (
    i_Name     varchar2,
    i_Status   varchar2,
    i_Order_No number := null
  ) return number is
    v_Service_Group_Id number;
  begin
    insert into Service_Groups
      (name, Status, Order_No)
    values
      (i_Name, i_Status, i_Order_No)
    returning _Service_Group_Id into v_Service_Group_Id;
  
    return v_Service_Group_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Update
  (
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Order_No         number := null
  ) is
  begin
    update Service_Groups t
       set t.Name     = i_Name,
           t.Status   = i_Status,
           t.Order_No = i_Order_No
     where t.Service_Group_Id = i_Service_Group_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Group_Delete(i_Service_Group_Id number) is
  begin
    delete Service_Groups t
     where t.Service_Group_Id = i_Service_Group_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Insert
  (
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Price            number,
    i_Order_No         number := null
  ) is
  begin
    insert into Services
      (Service_Group_Id, name, Status, Price, Order_No)
    values
      (i_Service_Group_Id, i_Name, i_Status, i_Price, i_Order_No);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Service_Insert
  (
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Price            number,
    i_Order_No         number := null
  ) return number is
    v_Service_Id number;
  begin
    insert into Services
      (Service_Group_Id, name, Status, Price, Order_No)
    values
      (i_Service_Group_Id, i_Name, i_Status, i_Price, i_Order_No)
    returning Service_Id into v_Service_Id;
  
    return v_Service_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Update
  (
    i_Service_Id       number,
    i_Service_Group_Id number,
    i_Name             varchar2,
    i_Status           varchar2,
    i_Price            number,
    i_Order_No         number := null
  ) is
  begin
    update Services t
       set t.Service_Group_Id = i_Service_Group_Id,
           t.Name             = i_Name,
           t.Status           = i_Status,
           t.Price            = i_Price,
           t.Order_No         = i_Order_No
     where t.Service_Id = i_Service_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Delete(i_Service_Id number) is
  begin
    delete Services t
     where t.Service_Id = i_Service_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Component_Insert
  (
    i_Name           varchar2,
    i_Component_Type varchar2,
    i_Status         varchar2,
    i_Price          number
  ) is
  begin
    insert into Car_Components
      (name, Component_Type, Status, Price)
    values
      (i_Name, i_Component_Type, i_Status, i_Price);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Car_Component_Insert
  (
    i_Name           varchar2,
    i_Component_Type varchar2,
    i_Status         varchar2,
    i_Price          number
  ) return number is
    v_Car_Component_Id number;
  begin
    insert into Car_Components
      (name, Component_Type, Status, Price)
    values
      (i_Name, i_Component_Type, i_Status, i_Price)
    returning Car_Component_Id into v_Car_Component_Id;
  
    return v_Car_Component_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Component_Update
  (
    i_Car_Component_Id number,
    i_Name             varchar2,
    i_Component_Type   varchar2,
    i_Status           varchar2,
    i_Price            number
  ) is
  begin
    update Car_Components t
       set t.Name           = i_Name,
           t.Component_Type = i_Component_Type,
           t.Status         = i_Status,
           t.Price          = i_Price
     where t.Car_Component_Id = i_Car_Component_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Car_Component_Delete(i_Car_Component_Id number) is
  begin
    delete Car_Components t
     where t.Car_Component_Id = i_Car_Component_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Request_Insert
  (
    i_Request_Time   timestamp,
    i_Request_Type   varchar2,
    i_Client_Id      number,
    i_User_Id        number,
    i_Issue_Details  varchar2 := null,
    i_Issue_File_Sha varchar2 := null,
    i_Status         varchar2
  ) is
  begin
    insert into Requests
      (Request_Time, Request_Type, Client_Id, User_Id, Issue_Details, Issue_File_Sha, Status)
    values
      (Request_Time,
       i_Request_Type,
       i_Client_Id,
       i_User_Id,
       i_Issue_Details,
       i_Issue_File_Sha,
       i_Status);
  end;

  ----------------------------------------------------------------------------------------------------
  Function Request_Insert
  (
    i_Request_Time   timestamp,
    i_Request_Type   varchar2,
    i_Client_Id      number,
    i_User_Id        number,
    i_Issue_Details  varchar2 := null,
    i_Issue_File_Sha varchar2 := null,
    i_Status         varchar2
  ) return number is
    v_Request_Id number;
  begin
    insert into Requests
      (Request_Time, Request_Type, Client_Id, User_Id, Issue_Details, Issue_File_Sha, Status)
    values
      (i_Request_Time,
       i_Request_Type,
       i_Client_Id,
       i_User_Id,
       i_Issue_Details,
       i_Issue_File_Sha,
       i_Status)
    returning Request_Id into v_Request_Id;
  
    return v_Request_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Request_Update
  (
    i_Request_Id     number,
    i_Request_Time   timestamp,
    i_Request_Type   varchar2,
    i_Client_Id      number,
    i_User_Id        number,
    i_Issue_Details  varchar2 := null,
    i_Issue_File_Sha varchar2 := null,
    i_Status         varchar2
  ) is
  begin
    update Requests t
       set t.Request_Time   = i_Request_Time,
           t.Request_Type   = i_Request_Type,
           t.Client_Id      = i_Client_Id,
           t.User_Id        = i_User_Id,
           t.Issue_Details  = i_Issue_Details,
           t.Issue_File_Sha = i_Issue_File_Sha,
           t.Status         = i_Status
     where t.Request_Id = i_Request_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Request_Service_Save
  (
    i_Request_Id number,
    i_Service_Id number,
    i_Price      number,
    i_Note       varchar2
  ) is
  begin
    update Request_Services t
       set t.Price = i_Price,
           t.Note  = i_Note
     where t.Request_Id = i_Request_Id
       and t.Service_Id = i_Service_Id;
  
    if sql%notfound then
      insert into Request_Services
        (Request_Id, Service_Id, Price, Note)
      values
        (i_Request_Id, i_Service_Id, i_Price, i_Note);
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Request_Service_Delete
  (
    i_Request_Id number,
    i_Service_Id number
  ) is
  begin
    delete Request_Services t
     where t.Request_Id = i_Request_Id
       and t.Service_Id = i_Service_Id;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Item_Save
  (
    i_Request_Id       number,
    i_Service_Id       number,
    i_Car_Component_Id number,
    i_Count            number,
    i_Price            number,
    i_Total_Amount     number
  ) is
  begin
    update Request_Service_Items t
       set t.Count        = i_Count,
           t.Price        = i_Price,
           t.Total_Amount = i_Total_Amount
     where t.Request_Id = i_Request_Id
       and t.Service_Id = i_Service_Id
       and t.Car_Component_Id = i_Car_Component_Id;
  
    if sql%notfound then
      insert into Request_Service_Items
        (Request_Id, Service_Id, Car_Component_Id, count, Price, Total_Amout)
      values
        (i_Request_Id, i_Service_Id, i_Car_Component_Id, i_Count, i_Price, i_Total_Amout);
    end if;
  end;

  ----------------------------------------------------------------------------------------------------
  Procedure Service_Item_Delete
  (
    i_Request_Id       number,
    i_Service_Id       number,
    i_Car_Component_Id number
  ) is
  begin
    delete Request_Service_Items t
     where t.Request_Id = i_Request_Id
       and t.Service_Id = i_Service_Id
       and t.Car_Component_Id = i_Car_Component_Id;
  end;

end Onecar;
/
