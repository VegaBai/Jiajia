using UnityEngine;
using System.Collections;

public class MyAnimController : MonoBehaviour {
	
	Animator anim;
	// Use this for initialization
	//public GameObject player;

	void Start () {
		anim = GetComponent<Animator> ();
	}

	// Update is called once per frame
	void Update () {
		anim.SetBool("StartDancing", GlobalVariables.ArDetected);

	}
}
