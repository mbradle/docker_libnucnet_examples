FROM mbradle/docker_wn_user

ENV NAME VAR
ENV NAME DATA_DIR

WORKDIR /my-projects

RUN git -C ${WN_USER_TARGET} pull

WORKDIR /my-projects/wn_user/build

RUN make -f Makefile.libnucnet all_libnucnet

WORKDIR /my-projects/wn_user/build/libnucnet

CMD if [ "${VAR}" = "make libnucnet_data" ]; then cd ..; make -f Makefile.libnucnet libnucnet_data; else eval "${VAR}" ; fi
