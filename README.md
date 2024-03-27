# DBT 🪄 
Dbt stands for "data build tool." It's a really handy tool for people who work with data. Imagine you have a big pile of messy data - dbt helps you clean it up and make it useful.

![image](https://miro.medium.com/v2/resize:fit:1400/1*_oB1lNXl2RVjXBKKaV1CyA.png)

Here's how it works: 🤓

- **Cleaning Data:** First, you need to make sure your data is tidy. Dbt helps you do this by letting you write code to clean and organize your data. It's like tidying up your room before you start playing.
- **Building Models:** Once your data is clean, you can start building models. Models are like templates that help you understand your data better. Dbt lets you create these models easily, so you can see patterns and trends in your data.
- **Testing:** Dbt also helps you make sure your data is accurate. It lets you set up tests to check if your data is behaving the way it should. It's like having a buddy double-check your work to make sure you didn't miss anything.
- **Documenting:** It's important to keep track of what you're doing with your data. Dbt helps you document everything you're doing, so if someone else needs to look at your work later, they can understand what you've done.
- **Collaborating:** Dbt makes it easy for teams to work together on data projects. You can share your code with others, collaborate on building models, and make sure everyone is on the same page.

## Why Repo? 🌚
I was working on a large dataset stored in my data warehouse, particularly in BigQuery. I wanted to test dbt by applying it to that dataset, so I simply connected to this repo(Improved DX when tracking changes, especially beneficial for CI/CD configs). I wrote some models and macros to test my data and play around. So what are models and macros?

## Models 🛠️
A data model is an organized design of how the data of entities in a database are related to each other. A dbt model can be thought of as a blueprint of a table or view that represents entities in a database. It is written using SQL and Jinja. Dependencies and transformations are typically written here.

## Macros 🔄
Macros are like shortcuts or reusable pieces of code in dbt. They help you avoid repeating the same code over and over again. For instance, if you often need to calculate average sales per customer, you can create a macro for that calculation. Then, you can use that macro wherever you need to perform that calculation in your models.

```sql
{% macro avg_sales_per_customer() %}
    SELECT
        customer_id,
        AVG(sales_amount) AS avg_sales_per_customer
    FROM
        sales
    GROUP BY
        customer_id
{% endmacro %}
```

With this macro defined, you can now use it in your dbt models like this:
```sql
{{ avg_sales_per_customer() }}
```

> [!NOTE]
> When you compile your `dbt` project, dbt will replace the macro call `{{ avg_sales_per_customer() }}` with the `SQL` code defined in the macro. This saves you from having to write out the same calculation logic multiple times in your models, making your code cleaner and easier to maintain.

## Packages 📦
Packages in dbt are similar to _libraries_ in other programming languages. Packages contain pre-built models, macros, and other resources that you can use in your dbt projects. They save you time by providing ready-made solutions for common data analysis tasks. For instance, there are packages available for financial analysis, marketing analytics, and more. You can simply install a package and start using its resources in your project.

## TL;DR 👻
> [!IMPORTANT]
> dbt is an incredibly useful tool for working with data. It simplifies the process of cleaning, organizing, and analyzing data, making it accessible to both technical and non-technical users. With dbt, you can efficiently manage your data projects, collaborate with team members, and ensure the accuracy and reliability of your analyses. 
