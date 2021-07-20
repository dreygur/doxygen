FROM facthunder/cppcheck

COPY run-cppcheck.sh /run-cppcheck.sh

ENTRYPOINT ["/run-cppcheck.sh"]
