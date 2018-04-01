# ActiveRecord

### Migration

1. `create_table(name, options)`

Creates a table called name and makes the table object available to a block that can then add columns to it, following the same format as add_column. See example above. The options hash is for fragments like "DEFAULT CHARSET=UTF-8" that are appended to the create table definition.

2. `change_table(name, options)`

Allows to make column alterations to the table called name. It makes the table object available to a block that can then add/remove columns, indexes or foreign keys to it.

3. `drop_table(name)`

Drops the table called name.

4. `rename_table(old_name, new_name)`

Renames the table called old_name to new_name.

5. `add_column(table_name, column_name, type, options)`

Adds a new column to the table called table_name named column_name specified to be one of the following types: :string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean. A default value can be specified by passing an options hash like { default: 11 }. Other options include :limit and :null (e.g. { limit: 50, null: false }) -- see ActiveRecord::ConnectionAdapters::TableDefinition#column for details.

6. `rename_column(table_name, column_name, new_column_name)`

Renames a column but keeps the type and content.

7. `change_column(table_name, column_name, type, options)`

Changes the column to a different type using the same parameters as add_column.

8. `remove_column(table_name, column_names)`

Removes the column listed in column_names from the table called table_name.

9. `add_index(table_name, column_names, options)`

Adds a new index with the name of the column. Other options include :name, :unique (e.g. { name: 'users_name_index', unique: true }) and :order (e.g. { order: { name: :desc } }).

10. `remove_index(table_name, column: column_name)`

Removes the index specified by column_name.

11. `remove_index(table_name, name: index_name)`

Removes the index specified by index_name.

### Ala carte

1. Redo a migration

```
$ rake db:migrate:redo VERSION=[VERSION NUMBER HERE]
```

2. Drop a table via console

```
console:> ActiveRecord::Migration.drop_table(:table_name_here)
```

3. List all tables
```
console:> ActiveRecord::Base.connection.tables
```
