import Foundation

func curry <A1, A2, A3, R> (_ f: @escaping (A1, A2, A3) -> R) -> (A1) -> (A2) -> (A3) -> R {

    return { a1 in { a2 in { a3 in f(a1, a2, a3) } } }

}

