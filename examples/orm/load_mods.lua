return {
    mysql_m = {
        launch_seq = 100,
        launch_num = 1,
        mod_args = {
            {
                instance_name = "admin",
                db_conf = {
                    host = '127.0.0.1',
                    port = '3306',
                    max_packet_size = 1048576,
                    user = 'root',
                    password = '123456',
                    database = 'admin',
                }
            }
        }
    },

    orm_table_m = {
        launch_seq = 1000,
        launch_num = 1,
        mod_args = {
            {
                instance_name = "player",
                orm_plug = "entry_player",
            },
        }
    },
    test_m = {
        launch_seq = 10000,
        launch_num = 1,
    }
}