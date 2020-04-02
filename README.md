# speedtest

It's speedtest from

```
pip install speedtest
```

Collect statistics to elasticsearch with

```
{"download":49.07,"upload":10.42,"@timestamp":"2020-04-02T07:19:41"}
```

Reference : https://pypi.org/project/speedtest-cli/

# Usage

`docker run -e INTERVAL=30 -e HOST=http://<elasticsearch-host> -d jibsoft/speedtest`
