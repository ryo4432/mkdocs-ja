FROM squidfunk/mkdocs-material:latest

# Perform build and cleanup artifacts
RUN \
  apk add --update --no-cache \
           graphviz \
           ttf-freefont && \
  pip install fontawesome_markdown && \
  pip install python-markdown-math && \
  pip install plantuml-markdown && \
  pip3 install markdown_inline_graphviz_extension --user && \
  pip install mkdocs-ivory && \
  pip install mkdocs-windmill && \
  pip install mkdocs-alabaster

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]