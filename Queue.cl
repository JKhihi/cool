class ListNode {
    data : Object;
    next : ListNode;
    
    init(value : Object) : ListNode {
        {
            data <- value;
            next <- void;
            self;
        }
    };
    
    getData() : Object { data };
    
    getNext() : ListNode { next };
    
    setNext(node : ListNode) : ListNode {
        {
            next <- node;
            self;
        }
    };
};

class Queue {
    front : ListNode;
    rear : ListNode;
    count : Int;
    
    init() : Object {
        {
            front <- void;
            rear <- void;
            count <- 0;
            self;
        }
    };
    
    enqueue(item : Object) : Queue {
        let newNode : ListNode <- (new ListNode).init(item) in {
            if isEmpty() then {
                front <- newNode;
                rear <- newNode;
            } else {
                rear.setNext(newNode);
                rear <- newNode;
            } fi;
            count <- count + 1;
            self;
        }
    };
    
    dequeue() : Object {
        if isEmpty() then {
            (new IO).out_string("Error: Queue is empty!\n");
            new Object;
        } else {
            let oldFront : ListNode <- front in {
                front <- front.getNext();
                count <- count - 1;
                if front = void then
                    rear <- void
                else
                    0
                fi;
                oldFront.getData();
            }
        } fi
    };
    
    peek() : Object {
        if isEmpty() then {
            (new IO).out_string("Error: Queue is empty!\n");
            new Object;
        } else
            front.getData()
        fi
    };
    
    isEmpty() : Bool {
        if front = void then
            true
        else
            false
        fi
    };
    
    size() : Int { count };
};

class Main {
    main() : Object {
        let q : Queue <- (new Queue).init(),
            io : IO <- new IO in {
            
            io.out_string("=== Queue Implementation Test ===\n");
            
            -- Test 1: Empty queue operations
            io.out_string("\nTest 1: Empty queue operations\n");
            io.out_string("Is empty: ");
            if q.isEmpty() then io.out_string("true") else io.out_string("false") fi;
            io.out_string("\nSize: ").out_int(q.size());
            
            -- Test 2: Enqueue operations
            io.out_string("\n\nTest 2: Enqueue operations\n");
            q.enqueue("First");
            q.enqueue("Second");
            q.enqueue("Third");
            io.out_string("After enqueue 3 items, size: ").out_int(q.size());
            
            -- Test 3: Peek operation
            io.out_string("\n\nTest 3: Peek operation\n");
            case q.peek() of
                s : String => io.out_string("Front element: ").out_string(s);
                o : Object => io.out_string("Unexpected type");
            esac;
            
            -- Test 4: Dequeue operations
            io.out_string("\n\nTest 4: Dequeue operations\n");
            io.out_string("Dequeue order: ");
            while not q.isEmpty() loop {
                case q.dequeue() of
                    s : String => io.out_string(s).out_string(" ");
                    o : Object => io.out_string("? ");
                esac;
            } pool;
            
            -- Test 5: Edge cases
            io.out_string("\n\nTest 5: Edge cases\n");
            io.out_string("Dequeue from empty queue: ");
            q.dequeue();
            io.out_string("\nFinal size: ").out_int(q.size());
            io.out_string("\n\n=== Test Completed ===\n");
        }
    };
};