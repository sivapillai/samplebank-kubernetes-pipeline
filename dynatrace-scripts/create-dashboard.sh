#!/bin/bash

PAYLOAD=$(cat <<EOF
{
  "metadata": {
    "configurationVersions": [
      6
    ],
    "clusterVersion": "1.244.128.20220627-170555"
  },
  "dashboardMetadata": {
    "name": "$1 $2:$3",
    "shared": true,
    "owner": "",
    "sharingDetails": {
        "linkShared": true,
        "published": true
     },
    "popularity": 10
  },
  "tiles": [
    {
      "name": "Security Vulnerability",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 76,
        "left": 190,
        "width": 418,
        "height": 190
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:security.securityProblem.open.global",
          "spaceAggregation": "MAX",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "Risk Level"
          ],
          "filterBy": {
            "nestedFilters": [],
            "criteria": []
          },
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "TOP_LIST",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "STACKED_COLUMN"
            },
            "seriesOverrides": [
              {
                "name": "MEDIUM",
                "color": "#ffee7c"
              },
              {
                "name": "HIGH",
                "color": "#dc172a"
              },
              {
                "name": "LOW",
                "color": "#ffa86c"
              }
            ]
          }
        ],
        "axes": {
          "xAxis": {
            "displayName": "",
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "color": "#7dc540"
              },
              {
                "color": "#f5d30f"
              },
              {
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": false
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": ""
      }
    },
    {
      "name": "Host health",
      "tileType": "HOSTS",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 0,
        "width": 266,
        "height": 152
      },
      "tileFilter": {},
      "chartVisible": true
    },
    {
      "name": "Problems",
      "tileType": "OPEN_PROBLEMS",
      "configured": true,
      "bounds": {
        "top": 76,
        "left": 0,
        "width": 152,
        "height": 152
      },
      "tileFilter": {}
    },
    {
      "name": "Infrastructure Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Application Host",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Docker",
      "tileType": "DOCKER",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 304,
        "width": 304,
        "height": 152
      },
      "tileFilter": {}
    },
    {
      "name": "Application Container",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 304,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 570,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service health",
      "tileType": "SERVICES",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 0,
        "width": 266,
        "height": 152
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "SERVICE",
        "customName": "Service health",
        "defaultName": "Service health",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "SERVICE": {
            "AUTO_TAGS": ["$4:$5"]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Service health",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 760,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Response time",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 760,
        "left": 304,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service response time",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 304,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.response.time",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "TAG",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": ["$4:$5"],
                    "evaluator": "IN"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "valueFormat": "auto",
            "properties": {
              "color": "TURQUOISE",
              "seriesType": "LINE"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "displayName": "",
            "visible": true
          },
          "yAxes": [
            {
              "displayName": "",
              "visible": true,
              "min": "AUTO",
              "max": "AUTO",
              "position": "LEFT",
              "queryIds": [
                "A"
              ],
              "defaultAxis": true
            }
          ]
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": false
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 600,
                "color": "#7dc540"
              },
              {
                "value": 6000,
                "color": "#f5d30f"
              },
              {
                "value": 60000,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": ""
      }
    },
    {
      "name": "Failed requests",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 646,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.errors.total.rate",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "TAG",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "$4",
                    "evaluator": "IN"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "properties": {
              "color": "DEFAULT"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": false
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 3,
                "color": "#7dc540"
              },
              {
                "color": "#f5d30f"
              },
              {
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": false
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1m"
      }
    },
    {
      "name": "Failed requests",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 760,
        "left": 646,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 836,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database host health",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB response time",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 304,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB Failed requests",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 646,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database health",
      "tileType": "DATABASES_OVERVIEW",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 0,
        "width": 266,
        "height": 152
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "DATABASE",
        "customName": "Database health",
        "defaultName": "Database health",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "DATABASE": {
            "NAME": [
              "test"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Database response time",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 304,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.response.time",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "NAME",
                "filterOperator": "OR",
                "entityAttribute": "entityName",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "test",
                    "evaluator": "IN",
                    "matchExactly": false
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "valueFormat": "auto",
            "properties": {
              "color": "TURQUOISE",
              "seriesType": "LINE"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "displayName": "",
            "visible": true
          },
          "yAxes": [
            {
              "displayName": "",
              "visible": true,
              "min": "AUTO",
              "max": "AUTO",
              "position": "LEFT",
              "queryIds": [
                "A"
              ],
              "defaultAxis": true
            }
          ]
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": false
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 600,
                "color": "#7dc540"
              },
              {
                "value": 6000,
                "color": "#f5d30f"
              },
              {
                "value": 60000,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": ""
      }
    },
    {
      "name": "Failed requests",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 646,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.errors.total.rate",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "NAME",
                "filterOperator": "OR",
                "entityAttribute": "entityName",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "test",
                    "evaluator": "IN",
                    "matchExactly": false
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "properties": {
              "color": "DEFAULT"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": false
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 3,
                "color": "#7dc540"
              },
              {
                "color": "#f5d30f"
              },
              {
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": false
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1m"
      }
    },
    {
      "name": "Database performance",
      "tileType": "DATABASE",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 988,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "assignedEntities": [
        "SERVICE-49AEE084C05915AB"
      ]
    },
    {
      "name": "DB health parameters",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 988,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Application",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1102,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Web application",
      "nameSize": "large",
      "tileType": "APPLICATION",
      "configured": true,
      "bounds": {
        "top": 1140,
        "left": 304,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "assignedEntities": [
        "APPLICATION-EA7C4B59F27D43EB"
      ]
    },
    {
      "name": "",
      "tileType": "APPLICATIONS",
      "configured": true,
      "bounds": {
        "top": 1140,
        "left": 0,
        "width": 266,
        "height": 190
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "APPLICATION",
        "customName": "",
        "defaultName": "Monitored Web  applications",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "APPLICATION": {
            "APPLICATION_TYPE": [
              "0"
            ],
            "APPLICATION_STATUS": [
              "0"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Application health",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1330,
        "left": 0,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": " Application parameters",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1444,
        "left": 304,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "",
      "tileType": "SYNTHETIC_TESTS",
      "configured": true,
      "bounds": {
        "top": 1140,
        "left": 988,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "WEB_CHECK",
        "customName": "",
        "defaultName": "Tagged synthetic monitor",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "WEB_CHECK": {
            "AUTO_TAGS": [
              "Staging"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Synthetic monitors",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1444,
        "left": 988,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "World map",
      "tileType": "APPLICATION_WORLDMAP",
      "configured": true,
      "bounds": {
        "top": 1140,
        "left": 646,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "assignedEntities": [
        "APPLICATION-EA7C4B59F27D43EB",
        "GEOLOCATION-0000000000000000",
        "WORLD"
      ],
      "metric": "APDEX"
    },
    {
      "name": "Apdex rating for users",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1444,
        "left": 646,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Environment Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 0,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    }
  ]
}
EOF
)
echo $PAYLOAD
curl -H "Content-Type: application/json" -H "Authorization: Api-Token ${DT_TOKEN}" -X POST -d "${PAYLOAD}" ${DT_URL}/api/config/v1/dashboards
