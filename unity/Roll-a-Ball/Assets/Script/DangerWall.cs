using UnityEngine;
using System.Collections;

public class DangerWall : MonoBehaviour {

	void OnCollisionEnter(Collision hit)
	{
		if (hit.gameObject.CompareTag ("Player")) 
		{
			Application.LoadLevel (Application.loadedLevel);
		}
			
	}
}
