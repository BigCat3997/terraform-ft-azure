import os
import json

RESOURCE_GROUP_NAMES_JSON = os.getenv("RESOURCE_GROUP_NAMES_JSON")
RESOURCE_GROUP_LOCATION = os.getenv("RESOURCE_GROUP_LOCATION")

def make_content():
    resource_groups = [
        {
            "name": rg,
            "location": RESOURCE_GROUP_LOCATION
        }
        for rg in json.loads(RESOURCE_GROUP_NAMES_JSON)
    ]

    content_json = {
        "resource_groups": resource_groups
    }
    
    # print content to shell of os get result
    print(json.dumps(content_json))
    return content_json
    


def main():
    make_content()


if __name__ == "__main__":
    main()