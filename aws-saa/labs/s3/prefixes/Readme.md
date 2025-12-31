## Create Bucket

```sh
aws s3 mb s3://prefixes-fun-13/
```

## Create Folder

```sh
aws s3api put-object --bucket prefixes-fun-13 --key=hello/
```

## Create Many Folders

```sh
aws s3api put-object --bucket prefixes-fun-13 --key="Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Nulla/sed/pulvinar/urna/Sed/vitae/turpis/pulvinar/eros/tristique/pretium/a/eget/leo/Vestibulum/ante/ipsum/primis/in/faucibus/orci/luctus/et/ultrices/posuere/cubilia/curae;/Fusce/venenatis/sit/amet/dolor/quis/scelerisque/Phasellus/accumsan/sagittis/hendrerit/Nam/interdum/odio/eu/magna/faucibus/lacinia/Duis/lectus/sapien/laoreet/ut/eleifend/nec/gravida/ullamcorper/odio/Maecenas/scelerisque/pretium/erat/quis/euismodDuis/eget/dapibus/tortor/sed/sodales/augue/Etiam/dignissim/arcu/a/urna/aliquam/vitae/luctus/tellus/tempor/Vestibulum/nec/ante/sem/Sed/massa/est/bibendum/non/facilisis/id/condimentum/at/justo/Vivamus/sollicitudin/malesuada/ullamcorper/Aenean/vel/urna/placerat/sapien/rutrum/fringilla/Curabitur/quis/convallis/risus/et/condimentum/felis/Donec/elementum/volutpat/dui/in/venenatisNunc/vitae/sem/cursus/consectetur/quam/ut/aliquet/lorem/Vestibulum/suscipit/finibus/nibh/ut/lobortis/Curabitur/eget/facilisis/odio/Cras/finibus/sit/abcde/fgh/klmno/pqrst/uvwxyz/"
```
