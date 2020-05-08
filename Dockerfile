FROM mbradle/docker_wn_user

ENV NAME VAR

WORKDIR /my-projects

RUN git -C ${WN_USER_TARGET} pull

WORKDIR /my-projects/wn_user/build

RUN make -f Makefile.libnucnet all_libnucnet

WORKDIR /my-projects/wn_user/build/libnucnet

CMD eval "${VAR}"
