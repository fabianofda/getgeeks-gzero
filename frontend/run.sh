robot -l NONE -o NONE -r NONE tasks/Delorean.robot
#robot -d ./logs -i short tests/Signup.robot
#robot -d ./logs tests/AttemptBeGeek.robot
pabot -d ./logs tests

rm -rf ./logs/browser
mkdir ./logs/browser 
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results type f -name "*.png") ./logs/browser/screenshot/

rm -rf ./logs/pabot_results

