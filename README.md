# Download folder organisation list
A simple script to organise your downloads folder. The script can easily be edited
to add more directories and extensions.

### Installation
#### Add the script to your crontab
For example, in `crontab -e`:
```bash
30 * * * * download-organise/organise-script.sh >> download-organise/log.txt
```
This will run the script every 30 minutes and log output to `log.txt`.

#### Ensure `cronie` is enabled and running
```bash
sudo systemctl start --now cronie.service
```
