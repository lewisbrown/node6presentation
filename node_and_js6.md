What's New in Node and JavaScript
=================================

Summary
-------

- Node 4
- ES6
    - Syntax additions
        - binary & octal literals
        - object literals
        - template strings
        - gather & spread
        - default parameters
        - for-of loops
        - arrow functions
    - Block-level Scope - let & const
    - Classes
    - Symbols
    - Typed Arrays - Buffers & Views
    - Collections - Map, WeakMap, Set, WeakSet
    - Iterators
    - Generators
    - Promises

What's new in Node 4.0.0
------------------------

### Modest performance gains

### Long Term Support versionsing

### Uses new version of V8

## Extended ES6 support

- --v8-options
- --harmony
- --harmony_modules
- --harmony_arrayincludes
- --harmony_regexps
- --harmony_proxies
- --harmony_destructuring
- --harmony_object

Syntax
======

Binary & Octal Literals
-----------------------

    var binary = 0b0001; 
    
    var octal = 0o755; 
    
    var hex = 0xFFC5;

Object literal extensions
-------------------------

-   old

<!-- end of list -->

    function f(x,y) { return { x: x, y: y}; }

-   new

<!-- end of list -->

    function f(x,y) { return {x, y}; }

## Object literal extensions

-   old

<!-- end of list -->

    var o = { a: "foo", b: "bar", c: 43 };

-   new

<!-- end of list -->

    var a = "foo", b = "bar", c = 43; 
    var o = {a, b, c}

## Object literal extensions

-   old

<!-- end of list -->

    var o = { method: function () { return 1; } };

-   new

<!-- end of list -->

    var o = { method() { return 1; } };


Template Strings
----------------

-   String interpolation!!!

<!-- end of list -->

    var s = "about", a = 5, b = 6; 
    console.log(`it is ${s} time: ${a+b}`);

-   embedded newlines

<!-- end of list -->

    console.log(`this is a 
        multi-line string`);


Gather & Spread Operator
------------------------

## Gather

    function bar(x, y, ...z) { console.log(x,y,z); }

    bar(1,2,3,4,5,6,7); // 1 2 [3,4,5,6,7]

    function baz(...args) { 
        do.something.to(args); // no need for arguments quasi-array 
    }

## Spread

- "..." in front of any **iterable** "spreads" it out into individual
variables
- similar to "apply"

<!-- end of list -->

    function foo(x,y,z) { console.log(x,y,z); }

    foo.apply(null, [1,2,3]); // 1 2 3

    foo( ...[1,2,3]); // 1 2 3



    var a = [2,3,4]; 
    var b = [1, ...a, 5]; // [1, 2, 3, 4, 5]



    [..."abc"] // ['a', 'b', 'c']

Default parameters
------------------

- Not yet implemented in Node.

<!-- end of list -->

    function foo(x = 11, y = 12) { console.log(x + y); }



for ... of loops
----------------    

- for ... in - loops over object properties
- for ... of - loops over data in iterables
    -   works on iterables: Arrays, Maps, Sets, Generators, etc.
    -   allows break, continue, return

<!-- end of list -->

    for (let v of array) {
        console.log(v);
     }


Arrow Functions
---------------

-   concise lambda expressions with lexical "this"
-   limited capabilites compared to regular functions

<!-- end of list -->

    (first, last) => { 
        return first + " " + last; 
    } 
    
    (first, last) => first + " " + last;

    person => person.name;

    setInterval( () => console.log("can you hear me now?"), 1000);

    (param1, param2, ...rest) => { doSomethingCool(rest); };

    var returnObjLiteral = () => ({ foo: 1 });

## Arrows - example 

    var group = [ "Russ", "John", "Eric", "Rhonda" ];

    var nameLengths = group.map( s => s.length );

<!-- TODO  ## Examples :: lexical this 


Block-level Scope
-----------------

## Let

-   <kbd>let</kbd> introduces lexical scope

-   <kbd>let</kbd> variables are not hoisted!

## Lexical scope before

    var a = 2;

    (function () {
        var a = 3;
	console.log(a); // 3
    })();

    console.log(a); // 2

## Lexical scope now

     var a = 2;

     {
         let a = 3;
	 console.log(a); // 3
     }

     console.log(a); // 2

## Another example

     let i = "bob's your uncle";

     for (let i = 1; i <= 1; i++) {
     	 console.log(i);   // 1
     }

     console.log(i); // bob's your uncle

## Const

    const a = [1,2,3];
    a.push(4);
    console.log(a); // [1,2,3,4]

    a = 42; // TypeError

## Block level functions

Not implemented in Node yet

    {
      foo(); // works
      function foo() {}
    }

    foo(); // ReferenceError

Classes
-------
Syntactic sugar over standard JS prototype-based inheritance

## Class declarations

    class Polygon {
    	constructor(height, width) {
    	    this.height = height;
            this.width = width;
	}
    }

Class declarations are not hoisted

## Class expression

    var Polygon = class {
        constructor(height, width) {
	    this.height = height;
	    this.width = width;
	}

        set width(w) {
	    this.width = w;
	}
	
	get area() {
	    return this.height * this.width;
	}
	
	static distance(a, b) {
	    const dx = a.x - b.x;
	    const dy = a.y - b.y;
	    return Math.sqrt(dx*dx + dy*dy);
	}
    };

## Sub classing

    class Animal {
        constructor(name) {
	    this.name = name;
	}

	speak() {
	    console.log(this.name + ' makes a noise.');
	}
     }

     class Dog extends Animal {
         speak() {
	     super.speak();
	     console.log(this.name + ' barks.');
	 }
     }

Collections
-----------

## Map

Objects and Maps are very similar, but:

-  Maps do not have a prototype
-  Map keys can be of any type, not just Strings
-  But all keys must be of the same type, as with all values
-  Maps have a 'length' parameter, unlike Objects
-  Maps iterate in insertion order whereas Objects specify no order

## Map

    m = new Map();
    m.set("foo", 1);
    m.set(2, "bar");

    var kO = {};
    var kA = [];

    m.set(kO, 2);
    m.set(kA, 3);

    m.get(kO); -> 2
    m.size; -> 4

    n = new Map([['a', 1], ['b', 2], ['c', 3]]);

## Methods on Map

<div style="margin-left:10em;margin-right:10em;">

   ------------- ------------------ ---------
   set           &nbsp;&nbsp;&nbsp; has
   get                              size
   keys                             delete
   values                           clear
   entries                        
   ------------- ------------------ -------

</div>

    for (var [k,v] of m) {
        console.log(k + ' = ' + v);
    }

    m.forEach(function(v,k) {
                  console.log(k + ' = ' + v);
	      },
	      m
    );

## Weak Map

Like Map, but with keys that are weakly referenced.

As they need a reference, keys must be objects.

No primitive keys allowed (string, number, bool, null, undefined, symbol).

#### Methods

- set
- get
- has
- delete

## Set

    let s = new Set([1,3,5,1,3,5,1,3,5]); -> Set { 1, 3, 5 }

#### Methods
- add
- keys
- values
- entries
- has
- delete
- clear
- forEach

## Weak Set

- objects only

#### Methods

- add
- has
- delete

Typed Arrays
------------

## Typed Arrays
-   array-like objects providing a mechanism for accessing raw binary
    data
-   not true Arrays
-   can be converted to true Arrays by using <kbd>Array.from</kbd>
-   Buffers and Views

## Buffers and Views
-   ArrayBuffer
    -   generic, fixed-length container
    -   no access

## Buffers and Views
-   DataView
    -   provides context: type, offset, number of elements
    -   provides getter/setters
    -   can open multiple views on same buffer: can you say 'C'
    -   Types
        -   8, 16, 32 bit int and uint
        -   32, 64 bit floats

## Buffers and Views

    var buffer = new ArrayBuffer(16);

    var int32View = new Int32Array(buffer);

    for (var i = 0; i < int32View.length; i++) {
        int32View[i] = i*2;
    }

## C structs

     struct foo { unsigned long id;
                  char name[16];
     	          float amount;
     	        };
     
     var buffer = new ArrayBuffer(24);
     // read data into array
     var idView = new Uint32Array(buffer, 0, 1);
     var nameView = new Uint8Array(buffer, 4, 16);
     var amountView = new Float32Array(buffer, 20, 1);
     
     nameView[0]; // access name field

Generators
----------

## Generators
-   functions which can be exited and later re-entered with static
    bindings
-   returns an iterator for the function
-   calling iterator's next() method re-enters the function up till
    yield
-   yield returns a value for the present iteration

<!-- end of list -->

    function* fibonacci() { 
        let [prev, curr] = [0, 1]; 
        for (;;) { 
            [prev, curr] = [curr, prev + curr];
            yield curr; 
        } 
    }

## yield*

-   yield* iterates over its argument and yields each value returned

<!-- end of list -->

    makeIterator = function* makeIterator(array) {
        yield* array; 
    };

    ltrs = makeIterator(["a", "b", "c"]);

    for (var ltr = ltrs.next(); ! ltr.done; ltr = ltrs.next() ) {
        console.log(ltr.value); 
    }

## Generators: what's the point

-   generators are iterators - you don't have to always write convoluted
    iterator code
-   generators are lazy lists

Promises
--------

-   A Promise represents a proxy for a value not necessarily known when
    the promise is created
-   wraps asynchronous method so it can return immediately
-   returns an object upon which handlers can be associated to handle
    the eventual success or failure

<!-- end of list -->

    p = new Promise(function(resolve, reject) {...});

    p.then(onFulfilled, onRejected) 
    p.catch(onRejected)

## Promises

    'use strict'; 
    var promiseCount = 0; 
    const maxSeconds = 6;

    function testPromise() { 
        var thisPromiseCount = ++promiseCount; 
        var p = new Promise( function(resolve, reject) { 
                        let seconds = 
                            Math.round((Math.random() * (maxSeconds-1) + 1) 
                                * 1000)/1000; 
                        console.log(`${thisPromiseCount} : ${seconds} secs`); 
                        setTimeout( seconds * 1000); 
                    } 
                );

        p.then( (val) => console.log(val) ) 
        .catch( function (reason) {
            console.log(`handle rejected promise: ${reason}`); 
            } 
        ); 
    }

    for (let i = 0; i < 5; i++) { testPromise(); }

Symbols
-------

-   a new data type
-   unique and immutable
-   primary use is as an identifier for object properties
-   may use a description attribute - useful for debugging
-   similar idea to Lisp's gensym
-   accessible via Object.getOwnPropertySymbols(obj) and
    Reflect.ownKeys(obj)

<!-- end of list -->

    var sym1 = Symbol();
    var sym2 = Symbol(foo);
    var sym3 = Symbol(foo);

    sym2 = sym3 -> false

## Symbols: What's the point

1.  Collision-free object properties - hygenic extension

<!-- end of list -->

    var myMethodSym = Symbol(); 
    obj[myMethodSym] = myMethod;

2.  quasi-private properties - ignored by for-in, keys,
    hasOwnProperties,

3. use of standard symbols in implementations allows extension

## Some standard symbols

-   Symbol.iterator
-   Symbol.hasInstance
-   Symbol.match
-   bunch more - not implemented yet

<!-- TODO 
Protocols
---------
-->

Iterators and Iterables
-----------------------

## Iterable protocol

-   allows objects to define or customize their iteration behavior
-   must implement iterator method
    -   a thunk that returns an object conforming to the iterator
        protocol

## Iterator protocol

-   allows standard way to produce a sequence
-   implements a next() method
    -   a thunk that returns an object with one or two properties:
        -   done (boolean)
        -   value - optional

## Iterator examples

    var s = "str";
    typeof s[Symbol.iterator];  -> 'function'

    s_it = s[Symbol.iterator]();

    s_it.next(); -> { value: 's', done: false }
    s_it.next(); -> { value: 't', done: false }
    s_it.next(); -> { value: 'r', done: false }
    s_it.next(); -> { value: undefined, done: true }

    -   Builtin iterables: String, Array, TypedArray, Map, Set
    -   the following accept iterables
        -   all collections
        -   for-of loops, spread operator, yield*, destructuring assignment

## Generators are both iterators and iterables

    var gen = function*() {yield 1; yield 2; yield 3;}();

    [...gen] -> [1,2,3]

    var gen = function*() {yield 1; yield 2; yield 3;}();

    gen.next() -> { value: 1, done: false }

