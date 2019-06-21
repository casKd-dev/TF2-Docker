/home/steam/steamcmd/steamcmd.sh \
  +login anonymous \
  +force_install_dir /home/steam/tf2/ \
  +app_update 232250 validate \
  +quit

{ \
		echo '@ShutdownOnFailedCommand 1'; \
		echo '@NoPromptForPassword 1'; \
		echo 'login anonymous'; \
		echo 'force_install_dir /home/steam/tf2'; \
		echo 'app_update 232250'; \
		echo 'quit'; \
} > /home/steam/tf2/tf2_update.txt

/home/steam/tf2/srcds_run $@
