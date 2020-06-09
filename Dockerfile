FROM squidfunk/mkdocs-material:latest

RUN \
  apk add --no-cache \
  build-base cairo-dev cairo cairo-tools pango-dev gdk-pixbuf \
  jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev && \
  apk add --update npm && \
  apk add --update --no-cache \
           graphviz \
           ttf-freefont && \
  # pip plugin install
  pip3 install --no-cache-dir markdown_inline_graphviz_extension --user && \
  pip install --no-cache-dir \
  fontawesome_markdown \
  python-markdown-math \
  plantuml-markdown \
  mkdocs-ivory \
  mkdocs-windmill \
  mkdocs-alabaster && \
  # japanese font
  apk update && \
  apk add --no-cache curl fontconfig && \
  curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
  mkdir -p /usr/share/fonts/NotoSansCJKjp && \
  unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/NotoSansCJKjp/ && \
  rm NotoSansCJKjp-hinted.zip && \
  fc-cache -fv && \
  # mkpdfs-mkdocs-plugin install
  cd /tmp && git clone https://github.com/comwes/mkpdfs-mkdocs-plugin.git && \
  cd mkpdfs-mkdocs-plugin/ && pip install --editable ./ && \
  cd mkpdfs_mkdocs/design/ && npm install && npm run build-css

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]