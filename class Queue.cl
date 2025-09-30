class Queue {
    -- 队列内部使用链表实现
    elements : List;
    
    -- 初始化空队列
    init() : Object {
        {
            elements <- new List;
            self;
        }
    };
    
    -- 入队操作
    enqueue(element : Object) : Object {
        {
            elements <- elements.append(element);
            self;
        }
    };
    
    -- 出队操作
    dequeue() : Object {
        if elements.isEmpty() then
            -- 队列为空时返回空对象
            new Object
        else {
            let first : Object <- elements.head() in
            {
                elements <- elements.tail();
                first;
            }
        } fi
    };
    
    -- 查看队首元素
    front() : Object {
        if elements.isEmpty() then
            new Object
        else
            elements.head()
        fi
    };
    
    -- 检查队列是否为空
    isEmpty() : Bool {
        elements.isEmpty()
    };
    
    -- 获取队列大小
    size() : Int {
        elements.length()
    };
    
    -- 清空队列
    clear() : Object {
        {
            elements <- new List;
            self;
        }
    };
};

-- 链表类，用于实现队列
class List {
    -- 头节点
    head : Object;
    -- 尾节点
    tail : List;
    
    -- 初始化空链表
    init() : Object {
        {
            head <- new Object;
            tail <- new List;
            self;
        }
    };
    
    -- 检查链表是否为空
    isEmpty() : Bool {
        case head of
            o : Object => false;  -- 有头节点，不为空
            o : NoClass => true;  -- 无头节点，为空
        esac
    };
    
    -- 在链表末尾添加元素
    append(element : Object) : List {
        if isEmpty() then
            let newList : List <- new List in
            {
                newList.head <- element;
                newList.tail <- new List;
                newList;
            }
        else
            let newList : List <- new List in
            {
                newList.head <- head;
                newList.tail <- tail.append(element);
                newList;
            }
        fi
    };
    
    -- 获取链表头元素
    head() : Object {
        head
    };
    
    -- 获取链表尾部
    tail() : List {
        tail
    };
    
    -- 获取链表长度
    length() : Int {
        if isEmpty() then
            0
        else
            1 + tail.length()
        fi
    };
};

-- 主类，用于测试队列
class Main {
    main() : Object {
        {
            let queue : Queue <- new Queue in
            {
                -- 测试入队操作
                out_string("Testing enqueue operations...\n");
                queue.enqueue("First");
                queue.enqueue("Second");
                queue.enqueue("Third");
                
                -- 测试队列大小
                out_string("Queue size: ");
                out_int(queue.size());
                out_string("\n");
                
                -- 测试查看队首
                out_string("Front element: ");
                case queue.front() of
                    s : String => out_string(s);
                    o : Object => out_string("Empty");
                esac;
                out_string("\n");
                
                -- 测试出队操作
                out_string("Testing dequeue operations...\n");
                while not queue.isEmpty() loop
                    {
                        out_string("Dequeued: ");
                        case queue.dequeue() of
                            s : String => out_string(s);
                            o : Object => out_string("Empty");
                        esac;
                        out_string("\n");
                    }
                pool;
                
                -- 测试空队列操作
                out_string("Testing empty queue...\n");
                out_string("Is empty: ");
                if queue.isEmpty() then
                    out_string("true")
                else
                    out_string("false")
                fi;
                out_string("\n");
            };
        }
    };
};