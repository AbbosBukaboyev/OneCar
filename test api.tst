declare
  -- Local variables here
  i                  integer;
  v_User_Id          number;
  v_Car_Brand_Id     number;
  v_Car_Model_Id     number;
  v_Car_Id           number;
  v_Service_Group_Id number;
  v_Service_Id       number;
  v_Component_Id     number;
  v_Request_Id       number;
begin
  v_User_Id := Onecar.User_Insert(i_First_Name   => 'Ali',
                                  i_Last_Name    => 'Ali',
                                  i_Middle_Name  => null,
                                  i_Login        => 'aliali',
                                  i_Password     => '12345',
                                  i_Phone_Number => '1234',
                                  i_Email        => 'a@gmail.com',
                                  i_Status       => 'A');
  --  Onecar.User_Delete(v_User_Id);
  Onecar.User_Role_Save(i_User_Id => v_User_Id, i_Role_Code => 'CLIENT');
  --  Onecar.User_Role_Delete(i_User_Id => v_User_Id, i_Role_Code => 'CLIENT');
  Onecar.Client_Save(i_Client_Id => v_User_Id, i_Status => 'A');
  v_Car_Brand_Id := Onecar.Car_Brand_Insert(i_Name => 'Teslaa', i_Description => 'TEslaaa');
  v_Car_Model_Id := Onecar.Car_Model_Insert(i_Car_Brand_Id => v_Car_Brand_Id, i_Name => 'X');
  v_Car_Id       := Onecar.Car_Insert(i_Car_Model_Id        => v_Car_Model_Id,
                                      i_Car_Brand_Id        => v_Car_Brand_Id,
                                      i_Vin_Number          => '1212',
                                      i_Year_Of_Manufacture => '2022');
  Onecar.Client_Car_Save(i_Client_Id    => v_User_Id,
                         i_Car_Id       => v_Car_Id,
                         i_State_Number => '121',
                         i_Color        => 'yellow',
                         i_Status       => 'A');

  v_Service_Group_Id := Onecar.Service_Group_Insert(i_Name     => 'Oil change',
                                                    i_Status   => 'A',
                                                    i_Order_No => 1);

  v_Service_Id   := Onecar.Service_Insert(i_Service_Group_Id => v_Service_Group_Id,
                                          i_Name             => 'Oil change 1',
                                          i_Status           => 'A',
                                          i_Price            => 100,
                                          i_Order_No         => 1);
  v_Component_Id := Onecar.Car_Component_Insert(i_Name           => 'Oil',
                                                i_Component_Type => 'O',
                                                i_Status         => 'A',
                                                i_Price          => 100);
  v_Request_Id   := Onecar.Request_Insert(i_Request_Time   => Current_Timestamp,
                                          i_Request_Type   => 'M',
                                          i_Client_Id      => v_User_Id,
                                          i_Car_Id         => v_Car_Id,
                                          i_Issue_Details  => 'issue',
                                          i_Issue_File_Sha => null,
                                          i_Status         => 'C');
  Onecar.Request_Service_Save(i_Request_Id => v_Request_Id,
                              i_Service_Id => v_Service_Id,
                              i_Price      => 1000,
                              i_Note       => 'null');
  Onecar.Service_Item_Save(i_Request_Id   => v_Request_Id,
                           i_Service_Id   => v_Service_Id,
                           i_Component_Id => v_Component_Id,
                           i_Count        => 10,
                           i_Price        => 10,
                           i_Total_Amount => 100);
end;
/