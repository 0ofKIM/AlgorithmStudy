import Foundation

func gcd(_ a:Int, _ b:Int) -> Int64 {
    return a == 0 ? Int64(b) : gcd(b % a, a)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    let w64 = Int64(w)
    let h64 = Int64(h)
    return w64 * h64 - w64 - h64 + gcd(w, h) 
    // w * h - (w/gcd + h/gcd - 1) * gcd
}
