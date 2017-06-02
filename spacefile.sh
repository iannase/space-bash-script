#! /bin/sh
# Find out some interesting things about Space!
# Ian Annase
#                           *     .--.
#                                / /  `
#               +               | |
#                      '         \ \__,
#                  *          +   '--'  *
#                      +   /\
#         +              .'  '.   *
#                *      /======\      +
#                      ;:.  _   ;
#                      |:. (_)  |
#                      |:.  _   |
#            +         |:. (_)  |          *
#                      ;:.      ;
#                    .' \:.    / `.
#                   / .-'':._.'`-. \
#                   |/    /||\    \|
#             jgs _..--"""````"""--.._
#           _.-'``                    ``'-._
#         -'                                '-

chmod 777 space.sh
choice=1
kelvin=0
precision=0.0
enter=0

# loop through the menu
until [ $choice = 0 ]; do
echo "Welcome to your space engine!"
echo " "
echo "Please choose from the following options:"
echo " "
echo "1 - Get the location of major satellites around the world."
echo "2 - Find out a star's type and color."
echo "3 - Watch Star Wars - Episode IV inside of terminal."
echo "4 - Run the educational space C++ app."
echo "0 - Exit"
echo " "

# user input
read -p "choice (0-4): " choice
echo ""

if [ $choice = 1 ]; then
    wget http://www.celestrak.com/NORAD/elements/stations.txt
    cat stations.txt

elif [ $choice = 2 ]; then
    echo "Star temperature range (2400 to 100000 Kelvin)"
    read -p "How hot is the star (in kelvin): " kelvin

    echo ""
    echo ""

    # Find out the star type
    if [[ $kelvin -ge 2400   &&  $kelvin -lt 3700 ]]; then
        echo "Star Type: M"
        printf "Precise: M"
        echo "scale=4;10-(($kelvin-2400.0)/130.0)" | bc
        echo "Star color: Light orange red"
    elif [[ $kelvin -ge 3700   &&  $kelvin -lt 5200 ]]; then
        echo "Star Type: K"
        printf "Precise: K"
        echo "scale=4;10-(($kelvin-3700.0)/150.0)" | bc
        echo "Star color: Pale yellow orange"
    elif [[ $kelvin -ge 5200   &&  $kelvin -lt 6000 ]]; then
        echo "Star Type: G"
        printf "Precise: G"
        echo "scale=4;10-(($kelvin-5200.0)/80.0)" | bc
        echo "Star color: Yellowish white"
    elif [[ $kelvin -ge 6000   &&  $kelvin -lt 7500 ]]; then
        echo "Star Type: F"
        printf "Precise: F"
        echo "scale=4;10-(($kelvin-6000.0)/150.0)" | bc
        echo "Star color: White"
    elif [[ $kelvin -ge 7500   &&  $kelvin -lt 10000 ]]; then
        echo "Star Type: A"
        printf "Precise: A"
        echo "scale=4;10-(($kelvin-7500.0)/250.0)" | bc
        echo "Star color: Bluish white"
    elif [[ $kelvin -ge 10000   &&  $kelvin -lt 30000 ]]; then
        echo "Star Type: B"
        printf "Precise: B"
        echo "scale=4;10-(($kelvin-10000.0)/2000.0)" | bc
        echo "Star color: Deep blue white"
    elif [[ $kelvin -ge 30000   &&  $kelvin -lt 100000 ]]; then
        echo "Star Type: O"
        printf "Precise: O"
        echo "scale=4;10-(($kelvin-30000.0)/7000.0)" | bc
        echo "Star color: Blue"
    fi
    
    echo ""
    read -p "Enter 1 to continue" enter

# Star Wars
elif [ $choice = 3 ]; then
    telnet towel.blinkenlights.nl

#Run the C++ app, bring it in from GitHub
elif [ $choice = 4 ]; then
    wget https://gist.githubusercontent.com/iannase/ccb19c02a536e38cde57cbbc06fc6ac9/raw/c694f737f9e3cbf48b26e7b4ebe31b23051ae850/space.cpp
    make
    ./space1

elif [ $choice = 0 ]; then
    break

else
    echo "Invalid choice!"

fi 

echo " "
echo " "
echo " "

done

exit 0