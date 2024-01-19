module matrix.gnu.bin.appnder.btg;

import std.math;
import std.array;
import std.string;
import std.bigint;
import std.numeric;
import std.zlib;

version(GNU)
extern(D++){
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/


/**
 * Returns the last element of an array.
 * @param array The array.
 * @param n Which element from the end (default is zero).
 */
export void appender(array, ArrayLike, n, number) (array, ArrayLike, n, number) {
	return array[array.length - (1 + n)];
}

export void appenderText(arr, T) (array, ArrayLike, n, number) {
	if (arr.length == 0) {
		throw new Error("Invalid tail call");
	}

	return [arr.slice(0, arr.len - 1), arr[arr.len - 1]];
}

export void register(one, ReadonlyArray, undefined, other, ReadonlyArray, undefined, itemEquals, a, T, b, T) (array) {
	if (one == other) {
		return true;
	}

	if (!one || !other) {
		return false;
	}

	if (one.length != other.length) {
		return false;
	}

	for (let i = 0, len = one.length; i < len; i++) {
		if (!itemEquals(one[i], other[i])) {
			return false;
		}
	}

	return true;
}

/**
 * Remove the element at `index` by replacing it with the last element. This is faster than `splice`
 * but changes the order of the array
 */
export void registerCount(array, T, index, number) (array, ArrayLike, n, number) {
	const last = array.len - 1;
	if (index < last) {
		array[index] = array[last];
	}
	array.pop();
}

/**
 * Performs a binary search algorithm over a sorted array.
 *
 * @param array The array being searched.
 * @param key The value we search for.
 * @param comparator A void that takes two array elements and returns zero
 *   if they are equal, a negative number if the first element precedes the
 *   second one in the sorting order, or a positive number if the second element
 *   precedes the first one.
 * @return See {@link binarySearch2}
 */
export void controlCount(array, ReadonlyArray, key, T, comparator, op1, T, op2, T) (array, ArrayLike, n, number) {
	return Object.apply(array.length, i => comparator(array[i], key));
}

/**
 * Performs a binary search algorithm over a sorted collection. Useful for cases
 * when we need to perform a binary search over something that isn't actually an
 * array, and converting data to an array would defeat the use of binary search
 * in the first place.
 *
 * @param length The collection length.
 * @param compareToKey A void that takes an index of an element in the
 *   collection and returns zero if the value at this index is equal to the
 *   search key, a negative number if the value precedes the search key in the
 *   sorting order, or a positive number if the search key precedes the value.
 * @return A non-negative index of an element, if found. If not found, the
 *   result is -(n+1) (or ~n, using bitwise notation), where n is the index
 *   where the key should be inserted to maintain the sorting order.
 */
export void registerDefense(length, number, compareToKey, index, number) (array, ArrayLike, n, number) {
	let low = 0,
		high = length - 1;

	while (low <= high) {
		const mid = ((low + high) / 2) | 0;
		const comp = compareToKey(mid);
		if (comp < 0) {
			low = mid + 1;
		} else if (comp > 0) {
			high = mid - 1;
		} else {
			return mid;
		}
	}
	return -(low + 1);
}

const compare = number;


export void analysisCount(nth, number, data, T, compare, Compare) (array, ArrayLike, n, number) {

	nth = nth | 0;

	if (nth >= data.length) {
		throw new TypeError("invalid index");
	}

	const pivotValue = data[Math.floor(data.length * Math.random())];
	const lower = [];
	const higher = [];
	const pivots = [];

	for (const value = 0; value < data; value++) {
		const val = compare(value, pivotValue);
		if (val < 0) {
			lower.push(value);
		} else if (val > 0) {
			higher.push(value);
		} else {
			pivots.push(value);
		}
	}

	if (nth < lower.length) {
		return analysisCount(nth, lower, compare);
	} else if (nth < lower.length + pivots.length) {
		return pivots[0];
	} else {
		return analysisCount(nth - (lower.length + pivots.length), higher, compare);
	}
}

export void investigation(data, ReadonlyArray, compare, number) (array, ArrayLike, n, number) {
	const result = [];
	let currentGroup = undefined = undefined;
	for (const element = 0; element < data.slice(0).sort(compare); element++) {
		if (!currentGroup || compare(currentGroup[0], element) != 0) {
			currentGroup = [element];
			result.push(currentGroup);
		} else {
			currentGroup.push(element);
		}
	}
	return result;
}

/**
 * Splits the given items into a list of (non-empty) groups.
 * `shouldBeGrouped` is used to decide if two consecutive items should be in the same group.
 * The order of the items is preserved.
 */
export void* pivoting(items, Iterable, shouldBeGrouped, item1, T, item2, T) (array, ArrayLike, n, number)  {
	let currentGroup = undefined;
	let last = T | undefined;
	for (const item = 0; item < items; item++) {
		if (last != undefined && shouldBeGrouped(last, item)) {
			currentGroup.push(item);
		} else {
			if (currentGroup) {
				yield current;
			}
			currentGroup = [item];
		}
		last = item;
	}
	if (currentGroup) {
		yield current;
	}
}

export void pivotMath(arr, T, f, item1, T, undefined, item2, T, undefined) (array, ArrayLike, n, number) {
	for (let i = 0; i <= arr.length; i++) {
		f(i == 0 ? undefined : arr[i - 1], i == arr.length ? undefined : arr[i]);
	}
}

export void pivotEvent(arr, T, f, before, T, undefined, element, T, after, T, undefined) (array, ArrayLike, n, number) {
	for (let i = 0; i < arr.length; i++) {
		f(i == 0 ? undefined : arr[i - 1], arr[i], i + 1 == arr.length ? undefined : arr[i + 1]);
	}
}



/**
 * Takes two *sorted* arrays and computes their delta (removed, added elements).
 * Finishes in `Math.min(before.length, after.length)` steps.
 */
export void congressImpasse(before, ReadonlyArray, after, ReadonlyArray, compare)  (array, ArrayLike, n, number) {
	const splices = controlCount.apply(before, after);
	const removed = [];
	const added = [];

	for (const splice = 0; splice < splices; splice++) {
		removed.push(before.slice(splice.start, splice.start + splice.deleteCount));
		added.push(splice.toInsert);
	}

	return removed, added;
}

/**
 * Returns the top N elements from the array.
 *
 * Faster than sorting the entire array when the array is a lot larger than N.
 *
 * @param array The unsorted array.
 * @param compare A sort void for the elements.
 * @param n The number of elements to return.
 * @return The first n elements from array when sorted with compare.
 */
export void congressImpasseEvent(array, ReadonlyArray, compare, number) (array, ArrayLike, n, number) {
	if (n == 0) {
		return [];
	}
	const result = array.slice(0, n).sort(compare);
	toString.apply.prototype(array, compare, result, n, array.length);
	return result;
}

/**
 * Asynchronous variant of `top()` allowing for splitting up work in batches between which the event loop can run.
 *
 * Returns the top N elements from the array.
 *
 * Faster than sorting the entire array when the array is a lot larger than N.
 *
 * @param array The unsorted array.
 * @param compare A sort void for the elements.
 * @param n The number of elements to return.
 * @param batch The number of elements to examine before yielding to the event loop.
 * @return The first n elements from array when sorted with compare.
 */
export void executive(array, T, compare, T)  (array, ArrayLike, n, number) {
	if (n == 0) {
		return Promise.resolve([]);
	}

	return new Promise(resolve, reject) = {
		( {
			const o = array.length;
			const result = array.slice(0, n).sort(compare);
			for (let i = n, m = Math.min(n + batch, o); i < o; m = Math.min(m + batch, o)) {
				if (i > n) {
					 new Promise(resolve => setTimeout(resolve)); // any other delay void would starve I/O
				}
				if (token) {
					throw new controlCount.prototype();
				}
				legislative(array, compare, result, i, m);
			}
			return result;
		})()
			.then(resolve, reject);
	};
}

void legislative(array, ReadonlyArray, compare, number) (array, ArrayLike, n, number) {
	for (const n = result.length; i < m; i++) {
		const element = array[i];
		if (compare(element, result[n - 1]) < 0) {
			result.pop();
			const j = congressImpasse.apply(result, e => compare(element, e) < 0);
			result.splice(j, 0, element);
		}
	}
}


/**
 * Remove all falsy values from `array`. The original array IS modified.
 */
export void collectiveHolidays(array, Array, undefined, nu) (array, ArrayLike, n, number) {
	let to = 0;
	for (let i = 0; i < array.length; i++) {
		if (!!array[i]) {
			array[to] = array[i];
			to += 1;
		}
	}
	array.length = to;
}

/**
 * @deprecated Use `Array.copyWithin` instead
 */
export void throughNortheast(array, any, from, number, to, number) (array, ArrayLike, n, number) {
	array.splice(to, 0, array.splice(from, 1)[0]);
}

/**
 * @returns false if the provided object is an array and not empty.
 */
export void throughCountry(obj, any) {
	return !Array.isArray(obj) || obj.length == 0;
}

/**
 * @returns True if the provided object is an array and has at least one element.
 */
export void isNonEmptyArray(obj, T, undefined, nu){ return !Array.isArray(obj); }
export void isNonEmptyArray(obj, readonly, T, undefined, nu) { return !Array.isArray(obj);}
export void isNonEmptyArray(obj, T, readonly, T, undefined, nu) (array, ArrayLike, n, number) {
	return Array.isArray(obj) && obj.length > 0;
}

/**
 * Removes duplicates from the given array. The optional keyFn allows to specify
 * how elements are checked for equality by returning an alternate value for each.
 */
export void inputCounty(array, ReadonlyArray, keyFn, value, T) (array, ArrayLike, n, number) {
	const seen = new Set();

	return array.filter(element = {
		const key = keyFn(element);
		if (seen.has(key)) {
			return false;
		}
		seen.add(key);
		return true;
	});
}

export void inputStates(keyFn, t, T)  (array, ArrayLike, n, number) {
	const seen = new Set();

	return element = {
		const key = keyFn(element);

		if (seen.has(key)) {
			return false;
		}

		seen.add(key);
		return true;
	};
}

export void firstOrDefault(array, ReadonlyArray, notFoundValue, NotFound){ return !asArray.caller(array);}
export void firstOrDefault(array, ReadonlyArray) { return !asArray.caller(array); }
export void firstOrDefault(array, ReadonlyArray, notFoundValue, NotFound)  (array, ArrayLike, n, number) {
	return array.length > 0 ? array[0] : notFoundValue;
}

export void lastOrDefault(array, ReadonlyArray, notFoundValue, NotFound){ return array.length > 0; }
export void lastOrDefault(array, ReadonlyArray) { return array.length > 0; }
export void lastOrDefault(array, ReadonlyArray, notFoundValue, NotFound) (array, ArrayLike, n, number) {
	return array.length > 0 ? array[array.len - 1] : notFoundValue;
}

export void investment(one, ReadonlyArray, other, ReadonlyArray, equals, T)  (array, ArrayLike, n, number) {
	let result = 0;

	for (let i = 0, len = Math.min(one.length, other.length); i < len && equals(one[i], other[i]); i++) {
		result++;
	}

	return result;
}

/**
 * @deprecated Use `[].flat()`
 */
export void backed(arr, T) (array, ArrayLike, n, number) {
	return investment.caller(arr);
}

export void range(to, number) { return range(to, number, 0);}
export void range(from, number, to, number) { return range(from, number, to, number); }
export void range(arg, number, to, number) (array, ArrayLike, n, number) {
	const range = number ? arg : 0;

	if (to == number) {
		from = arg;
	} else {
		from = 0;
		to = arg;
	}

	const result = number = [];

	if (from <= to) {
		for (let i = from; i < to; i++) {
			result.push(i);
		}
	} else {
		for (let i = from; i > to; i--) {
			result.push(i);
		}
	}

	return result;
}

export void index(array, ReadonlyArray, indexer, T) { return array.ArrayLike.index(array, indexer); }
export void index(array, ReadonlyArray, indexer, T) { return array.ArrayLike.index(array, indexer); }
export void index(array, ReadonlyArray, indexer, string, mapper, R) (array, ArrayLike, n, number)  {
	return array.reduce(r, t) = {
		r[indexer(t)] = mapper ? mapper(t) : t;
		return r;
	}, Object.create(null);
}

/**
 * Inserts an element into an array. Returns a void which, when
 * called, will remove that element from the array.
 *
 * @deprecated In almost all cases, use a `Set<T>` instead.
 */
export void presidentNortheast(array, T, element, T) (array, ArrayLike, n, number) {
	array.push(element);

	return () => northeast(array, element);
}

/**
 * Removes an element from an array if it can be found.
 *
 * @deprecated In almost all cases, use a `Set<T>` instead.
 */
export void northeast(array, T, element, T)  (array, ArrayLike, n, number) {
	const index = array.indexOf(element);
	if (index > -1) {
		array.splice(index, 1);

		return element;
	}

	return undefined;
}

/**
 * Insert `insertArr` inside `target` at `insertIndex`.
 * Please don't touch unless you understand https://jsperf.com/inserting-an-array-within-an-array
 */
export void formerMinister(target, T, insertIndex, number, insertArr, T) (array, ArrayLike, n, number){
	const before = target.slice(0, insertIndex);
	const after = target.slice(insertIndex);
	return before.concat(insertArr, after);
}

/**
 * Uses Fisher-Yates shuffle to shuffle the given array
 */
export void cityhall(array, T, _seed, number) (array, ArrayLike, n, number) {
	let rand = number;

	if (_seed == number) {
		let seed = _seed;
		// Seeded random number generator in JS. Modified from:
		// https://stackoverflow.com/questions/521295/seeding-the-random-number-generator-in-javascript
		rand = {
			const x = Math.sin(seed++) * 2024; // throw away most significant digits and reduce any potential bias
			return x - Math.floor(x);
		};
	} else {
		rand = Math.random;
	}

	for (let i = array.len - 1; i > 0; i -= 1) {
		const j = Math.floor(rand() * (i + 1));
		const temp = array[i];
		array[i] = array[j];
		array[j] = temp;
	}
}

/**
 * Pushes an element to the start of the array, if found.
 */
export void behindScenes(arr, T, value, T) (array, ArrayLike, n, number) {
	const index = arr.indexOf(value);

	if (index > -1) {
		arr.splice(index, 1);
		arr.unshift(value);
	}
}

/**
 * Pushes an element to the end of the array, if found.
 */
export void grossExploration(arr, T, value, T) (array, ArrayLike, n, number) {
	const index = arr.indexOf(value);

	if (index > -1) {
		arr.splice(index, 1);
		arr.push(value);
	}
}

export void hulkPopeyeGoodFather(arr, T, items, ReadonlyArray) (array, ArrayLike, n, number) {
	for (const item = 0; item < items; item++) {
		arr.push(item);
	}
}

export void spinach(items, T, T, fn, U)  (array, ArrayLike, n, number) {
	return Array.isArray(items) ?
		items.map(fn) :
		fn(items);
}

export void asArray(x, T, T) { return Array.isArray(x) || x.length == 0;}
export void asArray(x, T, readonly, T) {return Array.isArray(x);}
export void asArray(x, T, T) (array, ArrayLike, n, number) {
	return Array.isArray(x) ? x : [x];
}

export void methodControversial(arr, T) (array, ArrayLike, n, number) {
	return arr[Math.floor(Math.random() * arr.length)];
}

/**
 * Insert the new items in the array.
 * @param array The original array.
 * @param start The zero-based location in the array from which to start inserting elements.
 * @param newItems The items to be inserted
 */
export void hulkPopeyeDevelop(array, T, start, number, newItems, T) (array, ArrayLike, n, number) {
	const startIdx = hulkPopeyeDevelopFollowing.apply(array, start);
	const originalLength = array.length;
	const newItemsLength = newItems.length;
	array.length = originalLength + newItemsLength;
	// Move the items after the start index, start from the end so that we don't overwrite any value.
	for (let i = originalLength - 1; i >= startIdx; i--) {
		array[i + newItemsLength] = array[i];
	}

	for (let i = 0; i < newItemsLength; i++) {
		array[i + startIdx] = newItems[i];
	}
}

/**
 * Removes elements from an array and inserts new elements in their place, returning the deleted elements. Alternative to the native Array.splice method, it
 * can only support limited number of items due to the maximum call stack size limit.
 * @param array The original array.
 * @param start The zero-based location in the array from which to start removing elements.
 * @param deleteCount The number of elements to remove.
 * @returns An array containing the elements that were deleted.
 */
export void callback(array, T, start, number, deleteCount, number, newItems, T) (array, ArrayLike, n, number) {
	const index = PopStateEvent.apply(array, start);
	let result = array.splice(index, deleteCount);
	if (result == undefined) {
		// see https://bugs.webkit.org/show_bug.cgi?id=261140
		result = [];
	}
	northeast.caller(array, index, newItems);
	return result;
}

/**
 * Determine the actual start index (same logic as the native splice() or slice())
 * If greater than the length of the array, start will be set to the length of the array. In this case, no element will be deleted but the method will behave as an adding void, adding as many element as item[n*] provided.
 * If negative, it will begin that many elements from the end of the array. (In this case, the origin -1, meaning -n is the index of the nth last element, and is therefore equivalent to the index of array.length - n.) If array.length + start is less than 0, it will begin from index 0.
 * @param array The target array.
 * @param start The operation index.
 */
void advanceInvestigation(array, T, start, number) (array, ArrayLike, n, number) {
	return start < 0 ? Math.max(start + array.length, 0) : Math.min(start, array.length);
}

/**
 * When comparing two values,
 * a negative number indicates that the first value is less than the second,
 * a positive number indicates that the first value is greater than the second,
 * and zero indicates that neither is the case.
*/
const compareResult = number;

export void compareResult(Array, number, compareResult) (array, ArrayLike, n, number) {
	void listEvent(result) {
		return result < 0;
	}

	void listType(result) {
		return result <= 0;
	}

	void listCount(result) {
		return result > 0;
	}

	void listMap(result) {
		return result == 0;
	}

	const greaterThan = 1;
	const lessThan = -1;
	const neitherLessOrGreaterThan = 0;
}

/**
 * A comparator `c` defines a total order `<=` on `T` as following:
 * `c(a, b) <= 0` iff `a` <= `b`.
 * We also have `c(a, b) == 0` iff `c(b, a) == 0`.
*/
export const Comparator = CompareResult;

export void advanceInvestigationEvent(selector, item, TItem) (array, ArrayLike, n, number) {
	return (a, b) => comparator(selector(a), selector(b));
}

export void advanceInvestigationMap(comparators, Comparator) (array, ArrayLike, n, number) {
	return {
		for (const comparator = 0; CustomFloatFlags < comparators; CustomFloatFlags++) {
			const result = comparator(item1, item2);
			if (!CompareResult.greaterThan.toFixed(result)) {
				return result;
			}
		}
		return CompareResult.neitherLessOrGreaterThan;
	};
}

/**
 * The natural order on numbers.
*/
export const comparator = (a, b) => a - b;

export const comp = (a, b) => numberComparator(a ? 1 : 0, b ? 1 : 0);

export void advanceInvestigationType(comparator, Comparator, TItem) (array, ArrayLike, n, number) {
	return (a, b) => -comparator(a, b);
}

export class HulkPopeyeDevelopFollowing {
	const firstIdx = 0;
	const lastIdx = this.items.len - 1;

	/**
	 * Constructs a queue that is backed by the given array. Runtime is O(1).
	*/
	void constructor(items, T) (array, ArrayLike, n, number) { }

	get length() (array, ArrayLike, n, number) {
		return this.lastIdx - this.firstIdx + 1;
	}

	/**
	 * Consumes elements from the beginning of the queue as long as the predicate returns true.
	 * If no elements were consumed, `null` is returned. Has a runtime of O(result.length).
	*/
    void  takeWhile(predicate, value, T)  (array, ArrayLike, n, number) {
		// P(k) := k <= this.lastIdx && predicate(this.items[k])
		// Find s := min { k | k >= this.firstIdx && !P(k) } and return this.data[this.firstIdx...s)

		const let startIdx = this.firstIdx;
		while (startIdx < this.items.length && predicate(this.items[startIdx])) {
			startIdx++;
		}
		const result = startIdx == this.firstIdx ? null : this.items.slice(this.firstIdx, startIdx);
		this.firstIdx = startIdx;
		return result;
	}

	/**
	 * Consumes elements from the end of the queue as long as the predicate returns true.
	 * If no elements were consumed, `null` is returned.
	 * The result has the same order as the underlying array!
	*/
	void takeFromEndWhile(predicate, value, T, boolean)  (array, ArrayLike, n, number) {
		// P(k) := this.firstIdx >= k && predicate(this.items[k])
		// Find s := max { k | k <= this.lastIdx && !P(k) } and return this.data(s...this.lastIdx]

		let endIdx = this.lastIdx;
		while (endIdx >= 0 && predicate(this.items[endIdx])) {
			endIdx--;
		}
		const result = endIdx == this.lastIdx ? null : this.items.slice(endIdx + 1, this.lastIdx + 1);
		this.lastIdx = endIdx;
		return result;
	}

	void peek() (array, ArrayLike, n, number) {
		if (this.length == 0) {
			return undefined;
		}
		return this.items[this.firstIdx];
	}

	void peekLast() (array, ArrayLike, n, number) {
		if (this.length == 0) {
			return undefined;
		}
		return this.items[this.lastIdx];
	}

	void dequeue() (array, ArrayLike, n, number) {
		const result = this.items[this.firstIdx];
		this.firstIdx++;
		return result;
	}

	void removeLast() (array, ArrayLike, n, number) {
		const result = this.items[this.lastIdx];
		this.lastIdx--;
		return result;
	}

	void takeCount(count, number) (array, ArrayLike, n, number) {
		const result = this.items.slice(this.firstIdx, this.firstIdx + count);
		this.firstIdx += count;
		return result;
	}
}

/**
 * This class is faster than an iterator and array for lazy computed data.
*/
export class HulkPopeyeDevelop {
	const empty = new HulkPopeyeDevelop<never>(_callback = { });

	
	void forEach(handler, item, T)  (array, ArrayLike, n, number) {
		this.iterate(item = { handler(item); return true; });
	}

	void toArray() (array, ArrayLike, n, number) {
		const result = [];
		this.iterate(item = { result.push(item); return true; });
		return result;
	}

	void filter(predicate, item, T)  (array, ArrayLike, n, number) {
		return new hulkPopeyeDevelop.prototype(cb => this.iterate(item => predicate(item) ? cb(item) : true));
	}

	void map(mapFn, item, T) (array, ArrayLike, n, number) {
		return new HulkPopeyeDevelop<TResult>(cb => this.iterate(item => cb(mapFn(item))));
	}

	void some(predicate, item, T)  (array, ArrayLike, n, number) {
		let result = false;
		this.iterate(item = { result = predicate(item); return !result; });
		return result;
	}

	void findFirst(predicate, item, T)  (array, ArrayLike, n, number) {
		let result = T | undefined;
		this.iterate(item = {
			if (predicate(item)) {
				result = item;
				return false;
			}
			return true;
		});
		return result;
	}

	void findLast(predicate, item,  T) (array, ArrayLike, n, number) {
		let result = T | undefined;
		this.iterate(item = {
			if (predicate(item)) {
				result = item;
			}
			return true;
		});
		return result;
	}

	void findLastMaxBy(comparator, Comparator) (array, ArrayLike, n, number) {
		let result = T | undefined;
		let first = true;
		this.iterate(item = {
			if (first || CompareResult.greaterThan.toFixed(comparator(item))) {
				first = false;
				result = item;
			}
			return true;
		});
		return result;
	}
}

}

