# Check if .config-profile exist
# .config-profile is a file with links to configuration repositories
if [ ! -f ./.config-profile ]
then
	echo "ERROR! .config-profile file does not exist"
	exit 1
fi

# Create the configs folder and a register of installed configs
if [ ! -d ./.config ] 
then 
	mkdir ./.config && touch ./.config/.installed
fi

# Get the missing configs
sort ./.config-profile > temp1
sort ./.config/.installed > temp2
comm -3 temp1 temp2 > ./.config/.missing
rm temp1 temp2

cd ./.config
echo "Installing missing configurations:"
cat .missing

# Install missing repositories
while read r; do 
	git clone "$r" && echo "$r" >> .installed
done < .missing

rm .missing
