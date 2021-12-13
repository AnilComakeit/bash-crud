#!/bin/bash
getById(){
    searchData=$1
    echo ${bold}"-----------------------------------------------------"
    echo ${green}${remove}"EId      Name      Surname     Exp     Customer"
    cat Employee_Data.txt | grep "$searchData " 
    echo ${bold}"-----------------------------------------------------"
    return $searchData
}


updateByName(){
    searchData=$1
    oldData=`cat Employee_Data.txt| grep "$searchData "  | cut -d " " -f 3`
    echo "Present Name is : $oldData"
    read -p "Enter New Name of Employee: " newData      
    sed -i "s/$oldData/$newData/" Employee_Data.txt
    if [ $? -eq 0 ]
        then
            echo "Name Updated !!!"   
                 
    fi
}


updateBySurname(){
    searchData=$1
    oldData=`cat Employee_Data.txt | grep "$searchData "  | cut -d " " -f 5`
    echo "Present Surname is : $oldData"
    read -p "Enter New Surname of Employee: " newData      
    sed -i "s/$oldData/$newData/" Employee_Data.txt
    if [ $? -eq 0 ]
        then
            echo "Surname Updated !!!"   
                 
    fi
}


updateByCustomer(){
    searchData=$1
    oldData=`cat Employee_Data.txt | grep "$searchData "  | cut -d " " -f 9`
    echo "Present Customer is : $oldData"
    read -p "Enter New Customer of Employee: " newData      
    sed -i "s/$oldData/$newData/" Employee_Data.txt
    if [ $? -eq 0 ]
        then
            echo "Customer Updated !!!"   
                 
    fi
}





updateData(){
    read -p ${red}"Enter the id which you want to edit: " uid
    getById $uid
    echo ${yellow}${bold}"You can only edit name, surname and customer"
    echo ${cyan}"What Do you want to edit"

PS3=${red}"Please Enter Your Choice: ${green}"
echo ${green}${remove}
Options=("Name" "Surname" "Customer"  "Exit")

select option in "${Options[@]}"     
    do
        case $option in
            "Name")
                updateByName $uid
                ;;
            "Surname")
                updateBySurname $uid
                ;;
            "Customer")
                updateByCustomer $uid
                ;;
            "Exit")
                break 
                ;;
            *) echo "Invalid Option $REPLY";;
        esac
    done
   
    }
updateData 
 