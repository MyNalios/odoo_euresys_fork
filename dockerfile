FROM odoo:15

USER odoo

RUN pip3 install --no-cache-dir pyjwt && \
    echo "list_db = False" >> /etc/odoo/odoo.conf

# Option 1: download from github
# ADD https://api.github.com/repos/frepple/odoo/compare/15.0...HEAD /dev/null
# RUN cd /mnt/extra-addons && \
#    curl -L https://github.com/frePPLe/odoo/archive/15.0.tar.gz | tar -xz --strip-components=1

# Option 2: copy local files into docker image
COPY frepple /mnt/extra-addons/frepple
COPY autologin /mnt/extra-addons/autologin