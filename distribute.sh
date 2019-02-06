

# sh '/shared-paul-files/Webs/git-repos/Digitale-Overheid---WordPress-plugin-Stelselplaat/distribute.sh' &>/dev/null



echo '----------------------------------------------------------------';
echo 'Distribute DO stelselplaat plugin';

# clear the log file
> '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/development/wp-content/debug.log'
> '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/gc_live_import/wp-content/debug.log'

# copy to temp dir
rsync -r -a --delete '/shared-paul-files/Webs/git-repos/Digitale-Overheid---WordPress-plugin-Stelselplaat/' '/shared-paul-files/Webs/temp/'

# clean up temp dir
rm -rf '/shared-paul-files/Webs/temp/.git/'
rm '/shared-paul-files/Webs/temp/.gitignore'
rm '/shared-paul-files/Webs/temp/config.codekit3'
rm '/shared-paul-files/Webs/temp/distribute.sh'
rm '/shared-paul-files/Webs/temp/README.md'
rm '/shared-paul-files/Webs/temp/LICENSE'

cd '/shared-paul-files/Webs/temp/'
find . -name ‘*.DS_Store’ -type f -delete


# copy from temp dir to dev-env
rsync -r -a --delete '/shared-paul-files/Webs/temp/' '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/development/wp-content/plugins/do-stelselplaat/' 

# remove temp dir
rm -rf '/shared-paul-files/Webs/temp/'



# Naar GC import
rsync -r -a  --delete '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/development/wp-content/plugins/do-stelselplaat/' '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/gc_live_import/wp-content/plugins/do-stelselplaat/'

# Naar Eriks server
rsync -r -a  --delete '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/development/wp-content/plugins/do-stelselplaat/' '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/live-dutchlogic/wp-content/plugins/do-stelselplaat/'

# en een kopietje naar Sentia accept
rsync -r -a --delete '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/development/wp-content/plugins/do-stelselplaat/' '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/sentia/accept/www/wp-content/plugins/do-stelselplaat/'

# en een kopietje naar Sentia live
rsync -r -a --delete '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/development/wp-content/plugins/do-stelselplaat/' '/shared-paul-files/Webs/ICTU/Gebruiker Centraal/sentia/live/www/wp-content/plugins/do-stelselplaat/'


echo 'Ready';
echo '----------------------------------------------------------------';