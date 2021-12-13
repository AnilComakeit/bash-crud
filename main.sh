#!/bin/bash 
source config.sh

#Adding Data.
addData(){
    
    read -p ${yellow}"Enter Emp ID: " emp_id
    read -p ${yellow}"Enter Emp Name: " emp_name
    read -p ${yellow}"Enter Emp SurName: " emp_sname
    read -p ${yellow}"Enter Emp Experience: " emp_exp
    read -p ${yellow}"Enter Emp Customer: " emp_cust         
    cat Employee_Data.txt| cut -d " " -f 1 | grep -q $emp_id                                                                                                                                                                                                                                                                             
    if [ $? -eq 0 ]
         then
           echo ${bold}"Id Already present Try another id "
    else
     echo "$emp_id ---- $emp_name ---- $emp_sname ---- ${emp_exp}Years ---- $emp_cust" >> Employee_Data.txt
     echo ${bold}"Inserted !!!"${remove}            
    fi   
} 

#Updating Data
updateData(){
    source update.sh
    }

#DeleteData
deleteData(){
    read -p "Data to Delete of Employee: " dataToDelete
    grep -v "$dataToDelete " Employee_Data.txt > tmpfile && mv tmpfile Employee_Data.txt          
     if [ $? -eq 0 ]
        then
            echo "Deleted !!!"        
    fi
    }                                                                                                
#UpdateData
getById(){
    read -p "Enter Data to Search: " searchData
    cat Employee_Data.txt | grep "$searchData "
}

#Get ALL Data
getAllData(){
    echo ${bold}${red}"-----------------------------------------------------"
    echo ${green}${remove}"EId      Name      Surname     Exp     Customer"
    echo ${yellow}
    cat Employee_Data.txt 
    echo ${bold}${red}"-----------------------------------------------------"
    
} 
#Exit 
doExit(){
     echo "Exiting with status 0....."
     exit 0
 }


 
PS3=${red}"Please Enter Menu Choice: ${green}"
echo ${green}
Options=("Add Employee" "Edit Employee" "Delete Employee" "Search Employee" "View All Employee Data" "Exit")
select option in "${Options[@]}"     
    do
        case $option in
            "Add Employee")
                while true; 
                    do
                        addData
                        read -p "Do you wish to Add more?" yn
                    case $yn in
                        [Yy]* )  addData ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
                ;;
            "Edit Employee")
                
                 while true; 
                    do
                        updateData
                        read -p "Do you wish to Edit more?" yn
                    case $yn in
                        [Yy]* )  updateData ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
                ;;
            "Delete Employee")
                
                 while true; 
                    do
                        deleteData
                        read -p "Do you wish to Delete more?" yn
                    case $yn in
                        [Yy]* )  deleteData ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
                ;;
                
            "Search Employee")
                
                 while true; 
                    do
                        getById
                        read -p "Do you wish to Get more Records?" yn
                    case $yn in
                        [Yy]* )  getById ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
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

