FROM cm2network/steamcmd
LABEL maintainer="caskd@420blaze.it"

RUN /home/steam/steamcmd/steamcmd.sh \
        +login anonymous \
        +force_install_dir /home/steam/tf2/ \
        +app_update 232250 \
        +quit

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh

CMD ["-game", "$SRCDS_GAME", "-console", "-autoupdate", "-steam_dir", "/home/steam/steamcmd/", "-steamcmd_script", "/home/steam/tf2/tf2_update.txt", "-tickrate", "$SRCDS_TICKRATE", "-port", "$SRCDS_PORT", "-maxplayers_override", "$SRCDS_MAXPLAYERS", "+map", "$SRCDS_MAP", "-debug"]

RUN mkdir /home/steam/.steam/sdk32 && \
    ln -s linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

ENV SRCDS_PORT=27015 \
    SRCDS_TVPORT=27020 \
    SRCDS_MAXPLAYERS=32 \
    SRCDS_TICKRATE=120 \
    SRCDS_MAP=ctf_2fort \
    SRCDS_GAME=tf

EXPOSE 27015 27020
