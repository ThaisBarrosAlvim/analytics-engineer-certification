Welcome to your new dbt project!


### Configure enviroment

1. Create venv of python 3.10.16

2. Install requirements

    ```
    pip install -r requirements.txt
    ```
3. Reinstall libcrypto

    ```
    pip install --force-reinstall https://github.com/wbond/oscrypto/archive/d5f3437ed24257895ae1edd9e503cfb352e635a8.zip
    ```
4. Create ~/dbt/profiles.yml format: 
    ```
    default:
    target: dev
    outputs:
        dev:
        type: snowflake
        account: "your-account"

        # User/password auth
        user: "YOUR_USER"
        password: "your-password"

        role: "FEA_STUDENT"
        database: "FEA24_11"
        warehouse: "ACADEMY_WAREHOUSE"
        schema: "THAIS_RAW_ADVENTURE_WORKS"
        threads: 6
        client_session_keep_alive: False
        # query_tag: [anything]

    ```


### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
