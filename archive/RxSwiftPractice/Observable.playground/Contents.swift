import UIKit
import RxSwift

print("just")
Observable<Int>.just(1)
    .subscribe(
        onNext: {
            print($0)
        }
    )

Observable<Int>.of(1,2,3,4,5)
    .subscribe(
        onNext: {
            print($0)
        }
    )

Observable.of([1,2,3,4,5])
    .subscribe(
        onNext: {
            print($0)
        }
    )

Observable.from([1,2,3,4,5])
    .subscribe(
        onNext: {
            print($0)
        }
    )

Observable.of(1,2,3)
    .subscribe {
        print($0)
    }

Observable.of(1,2,3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }

print("____________")

Observable<Void>.empty()
    .subscribe {
        print($0)
    }


