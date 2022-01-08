import Foundation

extension Enigma {
    enum ETW: Int {
       /* case q = 1
        case w = 2
        case e = 3
        case r = 4
        case t = 5
        case z = 6
        case u = 7
        case i = 8
        case o = 9
        case a = 10
        case s = 11
        case d = 12
        case f = 13
        case g = 14
        case h = 15
        case j = 16
        case k = 17
        case p = 18
        case y = 19
        case x = 20
        case c = 21
        case v = 22
        case b = 23
        case n = 24
        case m = 25
        case l = 26*/
                
        case j = 1
        case w = 2
        case u = 3
        case l = 4
        case c = 5
        case m = 6
        case n = 7
        case o = 8
        case h = 9
        case p = 10
        case q = 11
        case z = 12
        case y = 13
        case x = 14
        case i = 15
        case r = 16
        case a = 17
        case d = 18
        case k = 19
        case e = 20
        case g = 21
        case v = 22
        case b = 23
        case t = 24
        case s = 25
        case f = 26
    }
        
    enum RotorI: Int {
        case d = 1
        case m = 2
        case t = 3
        case w = 4
        case s = 5
        case i = 6
        case l = 7
        case r = 8
        case u = 9
        case y = 10
        case q = 11
        case n = 12
        case k = 13
        case f = 14
        case e = 15
        case j = 16
        case c = 17
        case a = 18
        case z = 19
        case b = 20
        case p = 21
        case g = 22
        case x = 23
        case o = 24
        case h = 25
        case v = 26
    }
        
    enum RotorII: Int {
        case h = 1
        case q = 2
        case z = 3
        case g = 4
        case p = 5
        case j = 6
        case t = 7
        case m = 8
        case o = 9
        case b = 10
        case l = 11
        case n = 12
        case c = 13
        case i = 14
        case f = 15
        case d = 16
        case y = 17
        case a = 18
        case w = 19
        case v = 20
        case e = 21
        case u = 22
        case s = 23
        case r = 24
        case k = 25
        case x = 26
    }
    
    enum RotorIII: Int {
        case u = 1
        case q = 2
        case n = 3
        case t = 4
        case l = 5
        case s = 6
        case z = 7
        case f = 8
        case m = 9
        case r = 10
        case e = 11
        case h = 12
        case d = 13
        case p = 14
        case x = 15
        case k = 16
        case i = 17
        case b = 18
        case v = 19
        case y = 20
        case g = 21
        case j = 22
        case c = 23
        case w = 24
        case o = 25
        case a = 26
    }
        
    enum UKW: Int {
        case r = 1
        case u = 2
        case l = 3
        case q = 4
        case m = 5
        case z = 6
        case j = 7
        case s = 8
        case y = 9
        case g = 10
        case o = 11
        case c = 12
        case e = 13
        case t = 14
        case k = 15
        case w = 16
        case d = 17
        case a = 18
        case h = 19
        case n = 20
        case b = 21
        case x = 22
        case p = 23
        case v = 24
        case i = 25
        case f = 26
    }
}

extension Enigma.ETW {
    var asKey: Key {
        switch self {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
    
    static func fromKey(_ key: Key) -> Self {
        switch key {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
}

extension Enigma.RotorI {
    var asKey: Key {
        switch self {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
    
    static func fromKey(_ key: Key) -> Self {
        switch key {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
}

extension Enigma.RotorII {
    var asKey: Key {
        switch self {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
    
    static func fromKey(_ key: Key) -> Self {
        switch key {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
}

extension Enigma.RotorIII {
    var asKey: Key {
        switch self {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
    
    static func fromKey(_ key: Key) -> Self {
        switch key {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
}

extension Enigma.UKW {
    var asKey: Key {
        switch self {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
    
    static func fromKey(_ key: Key) -> Self {
        switch key {
        case .a:
            return .a
        case .b:
            return .b
        case .c:
            return .c
        case .d:
            return .d
        case .e:
            return .e
        case .f:
            return .f
        case .g:
            return .g
        case .h:
            return .h
        case .i:
            return .i
        case .j:
            return .j
        case .k:
            return .k
        case .l:
            return .l
        case .m:
            return .m
        case .n:
            return .n
        case .o:
            return .o
        case .p:
            return .p
        case .q:
            return .q
        case .r:
            return .r
        case .s:
            return .s
        case .t:
            return .t
        case .u:
            return .u
        case .v:
            return .v
        case .w:
            return .w
        case .x:
            return .x
        case .y:
            return .y
        case .z:
            return .z
        }
    }
}
