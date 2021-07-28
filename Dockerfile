FROM hrektts/doxygen

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]