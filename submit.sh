sudo apt-get install build-essential libssl-dev libffi-dev python-dev python3-dev
pip3 install twine
file="./Reef_Vision/__init__.py"
line=$(sed -n '2p' < $file)
version=$(grep -o "'.*'" $file | sed "s/'//g")

while true; do
    while true; do
        echo CURRENT VERSION IS $version
        IFS='.' read -r major minor patch <<< ${version}
        oldmajor=$major
        oldminor=$minor
        oldpatch=$patch
        read -p "Is this a major, minor, or patch change? [major][minor][patch]:" changetype
        case $changetype in

            major|Major|Maj|maj|ma|Ma)
                major=$(echo "$((major + 1))")
                minor=0
                patch=0
                echo YOU MADE A MAJOR CHANGE
                break
                ;;
            minor|Minor|Min|min|mi|Ma)
                minor=$(echo "$((minor + 1))")
                patch=0
                echo YOU MADE A MINOR CHANGE
                break
                ;;
            patch|Patch|P|p)
                patch=$(echo "$((patch + 1))")
                echo YOU MADE A PATCH
                break
                ;;
            *)
                echo Invalid Input
                ;;
        esac
    done

    while true; do
        read -p "New version is $major.$minor.$patch [y][n]:" userConf
        case $userConf in

            [yY]*)
                sed -i "s/$version/$major.$minor.$patch/g" $file
                trap "sed -i "s/$major.$minor.$patch/$version/g" $file ; echo "" ; exit 1" INT
                echo Version now $major.$minor.$patch
                break 2
                ;;
            [nN]*)  
                printf "\n"
                break
                ;;
            *)
                echo Invalid Input
                ;;
        esac
    done
done

historyFile="HISTORY.rst"
totalchanges=""
while true; do
    if [ -f "$historyFile" ]; then
        if [ $(sed -n '/^History/p;q' $historyFile) == "History" ]; then
            echo What changes did you make?
            while true; do
                read versionchange
                if [[ -z $versionchange ]]; then
                    break
                else
                    totalchanges="${totalchanges}* ${versionchange}\n"
                    printf "$totalchanges\n\n"
                    echo Anything Else?
                fi
            done
        else
            printf "History\n-------\n\n\n" > $historyFile   
        fi
        break
    else
        echo "History.rst doesn't exist"
        echo Creating Now...
        touch $historyFile
        printf "History\n-------\n\n\n" > $historyFile
    fi
done

python3 setup.py sdist bdist_wheel
sudo pip3 install "dist/Reef_Vision-$major.$minor.$patch.tar.gz"
sudo killserver.sh
sudo stopautoboot.sh
if [ $? -eq 0 ]; then
    echo Build Success. Now Releasing Version $major.$minor.$patch
    echo "ReefVision" | python3 -m twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
    sed -i "4i\
        $major.$minor.$patch ($(date +"%m-%d-%Y"))\n~~~~~~~~~~~~~~~~~~\n\n" $historyFile
    sed -i "7i\
        ${totalchanges}\n" $historyFile
else
    echo Build of version $major.$minor.$patch failed
fi
sudo pip3 uninstall -y Reef_Vision

echo Please verify verion release by running sudo pip3 install Reef-Vision==$major.$minor.$patch
