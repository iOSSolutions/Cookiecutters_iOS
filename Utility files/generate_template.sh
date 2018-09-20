# This is a shell script to transform the PRODUCTNAMEE directory into a cookie-cutter template

# Delete files that we don't want to include in the template
rm -rf PRODUCTNAMEE/Pods
rm -rf PRODUCTNAMEE/PRODUCTNAMEE.xcworkspace

#This is the only lookup that is done on filenames
LOOKUP="PRODUCTNAMEE"
EXPANDED="{{ cookiecutter.project_name | replace(' ', '') }}"

# Make the tree
find ./PRODUCTNAMEE -type d | while read FILE
do
    NEWFILE=`echo $FILE | sed -e "s/${LOOKUP}/${EXPANDED}/g"`
    echo "mkdir -p \"$NEWFILE\""
done

# Copy the files over
find ./PRODUCTNAMEE -type f | while read FILE
do
    NEWFILE=`echo $FILE | sed -e "s/${LOOKUP}/${EXPANDED}/g"`
    echo "cp \"$FILE\" \"$NEWFILE\""
done

# Do replacements
function replace {
    grep -rl $1 ./PRODUCTNAMEE | while read FILE
    do 
    NEWFILE=`echo $FILE | sed -e "s/${LOOKUP}/${EXPANDED}/g"`
        # Copy over incase the sed fails due to encoding
        # echo "echo \"$FILE\""
        echo "sed -e \"s/$1/$2/g\" \"$NEWFILE\" > t1 && mv t1 \"$NEWFILE\""
    done
}

replace "PRODUCTNAMEE" "{{ cookiecutter.project_name | replace(' ', '') }}"
replace "ORGANIZATIONNN" "{{ cookiecutter.company_name }}"
replace "DEVELOPERNAMEE" "{{ cookiecutter.developer_name }}"
replace "com.company.PRODUCTNAMEE" "{{ cookiecutter.bundle_identifier }}"
replace "DATECREATEDD" "{{cookiecutter.today_date}}"
replace "CLASSPREFIXX" "{{cookiecutter.class_prefix}}"
