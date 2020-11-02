import Foundation

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    return a == 0 ? b : gcd(b%a, a)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    return Int64( w*h-(w+h) ) + gcd(Int64(w),Int64(h))
}
