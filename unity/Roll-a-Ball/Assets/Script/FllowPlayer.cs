using UnityEngine;
using System.Collections;

public class FllowPlayer : MonoBehaviour 
{
	//ターゲットの参照
	public Transform target;

	//相対座標
	private Vector3 offset;

	void Start()
	{
		offset = GetComponent<Transform> ().position - target.position;
	}

	// Update is called once per frame
	void Update () 
	{

		// 自分の座標に、targetの座標に相対座標を足した値を設定する
		GetComponent<Transform>().position = target.position + offset;
	}
}
