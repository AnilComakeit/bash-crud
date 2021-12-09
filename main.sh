#!/bin/bash 
 
#Adding Data.
addData(){
    read -p "Enter Emp ID: " emp_id
    read -p "Enter Emp Name: " emp_name
    read -p "Enter Emp SurName: " emp_sname
    read -p "Enter Emp Experience: " emp_exp
    read -p "Enter Emp Customer: " emp_cust         
    cat Employee_Data.txt| cut -d " " -f 1 | grep -q $emp_id                                                                                                                                                                                                                                                                             
    if [ $? -eq 0 ]
         then
           echo "Id Already present Try another id "
    else
     echo "$emp_id ----  $emp_name ----  $emp_sname ----  ${emp_exp}Years ----  $emp_cust" >> /home/anil/Desktop/CRUD/Employee_Data.txt
     echo "Inserted !!!"            
    fi    
#Updating Data
updateData(){
    read -p "Enter Old Data of Employee: " oldData
    read -p "Enter New Data of Employee: " newData     
    sed -i "s/$oldData/$newData/" /home/anil/Desktop/CRUD/Employee_Data.txt
    if [ $? -eq 0 ]
        then
            echo "Updated !!!"        
    fi
    }
#DeleteData
deleteData(){
    read -p "Data to Delete of Employee: " dataToDelete
    grep -v $dataToDelete  /home/anil/Desktop/CRUD/Employee_Data.txt > tmpfile && mv tmpfile /home/anil/Desktop/CRUD/Employee_Data.txt          
     if [ $? -eq 0 ]
        then
            echo "Deleted !!!"        
    fi
    }                                                                                                
#UpdateData
getById(){
    read -p "Enter Data to Search: " searchData
    cat /home/anil/Desktop/CRUD/Employee_Data.txt | grep $searchData
}

#Get ALL Data
getAllData(){
    cat /home/anil/Desktop/CRUD/Employee_Data.txt
} 
#Exit 
doExit(){
     echo "Exiting with status 0....."
     exit 0
 }
PS3="Please Enter Your Choice: "
Options=("Add Employee" "Edit Employee" "Delete Employee" "Search Employee" "View All Employee Data" "Exit")

select option in "${Options[@]}"     
    do
        case $option in
            "Add Employee")
                addData
                ;;
            "Edit Employee")
                updateData
                ;;
            "Delete Employee")
                deleteData
                ;;
            "Search Employee")
                getById
                ;;
            "View All Employee Data")
                getAllData
                ;;
            "Exit")
                doExit 
                ;;
            *) echo "Invalid Option $REPLY";;
        esac
    done

