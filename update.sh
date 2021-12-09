#!/bin/bash
getById(){
    searchData=$1
    echo "-----------------------------------------------------"
    echo "EId      Name      Surname     Exp     Customer"
    cat Employee_Data.txt | grep $searchData
    echo "-----------------------------------------------------"

}


# cat Employee_Data.txt| grep 2 | cut -d " " -f "3"

updateByName(){
read -p "Enter Old Name of Employee: " oldData
    read -p "Enter New Name of Employee: " newData 
    # cat Employee_Data.txt| cut -d " " -f 1 | grep -q $emp_id                                                                                                                                                                                                                                                                             
    # if [ $? -eq 0 ]    
    # sed -i "s/$oldData/$newData/" Employee_Data.txt
    # if [ $? -eq 0 ]
    #     then
    #         echo "Name Updated !!!"   
    #         exit 0     
    # fi
}

updateData(){
    read -p "Enter the id which you want to edit: " uid
    getById $uid
    echo "You can only edit name, surname and customer"
    echo "What Do you want to edit"

PS3=${red}"Please Enter Your Choice: ${green}"
echo ${green}
Options=("Name" "Surname" "Customer"  "Exit")

select option in "${Options[@]}"     
    do
        case $option in
            "Name")
                updateByName
                ;;
            "Surname")
                echo "sname"
                ;;
            "Customer")
                echo "cust"
                ;;
            "Exit")
                exit 0 
                ;;
            *) echo "Invalid Option $REPLY";;
        esac
    done
   
    }
updateData 
 