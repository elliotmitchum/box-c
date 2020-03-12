FROM ubuntu:xenial

# Create 'app' user.

RUN groupadd --gid 1000 app \
	 && useradd --uid 1000 --gid app --shell /bin/bash --create-home app \
	 && chown -R app:app /home/app

# Install dependencies.

RUN apt-get update \
	 && apt-get install -y --no-install-recommends \
		  ca-certificates \
		  curl \
		  g++ \
		  gcc \
		  git \
		  libc-dev \
		  make \
	 && rm -rf /var/lib/apt/lists/*

# Install NeoVim.

RUN apt-get update \
	 && apt-get install -y --no-install-recommends software-properties-common \
	 && add-apt-repository -y ppa:neovim-ppa/stable \
	 && apt-get update \
	 && apt-get install -y --no-install-recommends neovim \
	 && apt-get purge -y software-properties-common \
	 && apt-get autoremove -y \
	 && rm -rf /var/lib/apt/lists/*

USER app

ADD init.vim /home/app/.config/nvim/init.vim

RUN curl -fLo /home/app/.local/share/nvim/site/autoload/plug.vim \
		  --create-dirs \
		  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	 && nvim +PlugInstall +qall

# Create app working space.

RUN mkdir -p /home/app/src
ADD main.c /home/app/src/main.c

USER root
RUN chown -R app:app /home/app/src
USER app

WORKDIR /home/app/src
CMD ["nvim", "/home/app/src/main.c"]

