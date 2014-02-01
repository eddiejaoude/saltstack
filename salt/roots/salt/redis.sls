redis:
    pkg:
        - installed
    service:
        - running
        - enable: True
        - reload: True
        - watch:
            - pkg: redis