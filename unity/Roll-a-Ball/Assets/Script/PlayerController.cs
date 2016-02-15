using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour 
{
	//spped調整する。
	public float speed = 10;

	void FixedUpdate ()
	{
		float x = Input.GetAxis("Horizontal");
		float z = Input.GetAxis("Vertical");

		Rigidbody rigidbody = GetComponent<Rigidbody> ();
		rigidbody.AddForce(x * speed, 0, z * speed);
	}
	
}
